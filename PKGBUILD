# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-bin
_pkgname=yabridge
pkgver=3.0.1
pkgrel=1
pkgdesc="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux"
epoch=
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'libxcb' 'lib32-libxcb')
makedepends=()
provides=('yabridge' 'yabridgectl')
conflicts=('yabridge' 'yabridgectl' 'yabridgectl-git')
options=('!strip')
install=yabridge.install
source=("https://github.com/robbert-vdh/yabridge/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('0b25ebaffd115cf5e4c7ae6acb76620b0f3a00e1fd820e5da344572c84f37b3c')

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 "${pkgdir}"/usr/bin
  install yabridge-{host,group}{,-32}.exe{,.so} "${pkgdir}"/usr/bin

  install -dm755 "${pkgdir}"/usr/lib
  install libyabridge-{vst2,vst3}.so "${pkgdir}"/usr/lib

  install yabridgectl "${pkgdir}"/usr/bin
}

# vim:set ts=2 sw=2 et:

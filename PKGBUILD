# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-bin
_pkgname=yabridge
pkgver=3.1.0
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
sha256sums=('28618be2fca7c6890a9adfb99667e724d6c7e68aba7ecd3b5112e800f6f9ce4b')

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 "${pkgdir}"/usr/bin
  install yabridge-{host,group}{,-32}.exe{,.so} "${pkgdir}"/usr/bin

  install -dm755 "${pkgdir}"/usr/lib
  install libyabridge-{vst2,vst3}.so "${pkgdir}"/usr/lib

  install yabridgectl "${pkgdir}"/usr/bin
}

# vim:set ts=2 sw=2 et:

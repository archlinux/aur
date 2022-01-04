# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-bin
_pkgname=yabridge
pkgver=3.7.0
pkgrel=4
pkgdesc="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux (includes yabridgectl)"
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
sha256sums=('46a68052157bd30c4aeb5b0eb84154582408eb099377716e3690518dec048384')

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 "$pkgdir/usr/bin"
  install yabridge-{host,group}.exe{,.so} "$pkgdir/usr/bin"
  install yabridge-{host,group}-32.exe{,.so} "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/lib"
  install libyabridge-{vst2,vst3}.so "$pkgdir/usr/lib"

  install yabridgectl "$pkgdir/usr/bin"
}

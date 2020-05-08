# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge
pkgver=1.1.0
pkgrel=1
pkgdesc="Yet Another VST bridge, run Windows VST2 plugins under Linux"
epoch=
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'libxcb' 'lib32-libxcb')
makedepends=()
install=yabridge.install
source=("https://github.com/robbert-vdh/yabridge/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a7d1cec5852096f928b746d9230065934d61b80dac77ef855838cb73b5962e29')

package() {
  cd "$srcdir/$pkgname"

  install -dm755 "${pkgdir}"/usr/bin
  install yabridge-host.exe{,.so} "${pkgdir}"/usr/bin
  install yabridge-host-32.exe{,.so} "${pkgdir}"/usr/bin

  install -dm755 "${pkgdir}"/usr/lib
  install libyabridge.so "${pkgdir}"/usr/lib
}

# vim:set ts=2 sw=2 et:

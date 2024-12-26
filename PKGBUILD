# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=easy-switcher
pkgver=0.3
pkgrel=1
pkgdesc="Keyboard layout switcher for Linux"
arch=(x86_64)
url="https://github.com/freemind001/$pkgname"
license=(GPL-2.0-only)
depends=(glibc)
makedepends=(fpc)
options=(!debug)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('879746528b7ac2db24d6cb14253964441ee1d8d95722b1407538622bbe282a70291a0f33a815128f8c0a31f028200581b5fecf58fcd994a2fa8fea7a823a18d9')

build() {
  cd $pkgname-$pkgver
  fpc $pkgname.lpr
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 $pkgname -t "$pkgdir"/usr/bin/
}

# Maintainer: Bahodir Mansurov <bahodir@mansurov.org>

pkgname=aspell-uz
pkgver=0.6
pkgrel=1
pkgdesc="Uzbek dictionary for aspell"
arch=('x86_64')
url="http://aspell.net/"
license=('custom')
depends=('aspell')
source=(ftp://ftp.gnu.org/gnu/aspell/dict/uz/aspell6-uz-$pkgver-0.tar.bz2)
sha512sums=('0542a83c149ad761d8bb964be556bfb2387404fce21e0e38d3c0fa8efef2d1587db0fa80140cf7de72da7f08bbb807ff931a95bb63c2a84771a197f5841e545b')

build() {
  cd aspell6-uz-$pkgver-0
  ./configure
  make
}

package() {
  cd aspell6-uz-$pkgver-0
  make DESTDIR="$pkgdir" install

  install -D -m644 Copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

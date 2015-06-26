# Maintainer: Eric Mrak <mail at ericmrak dot info>
pkgname="fry"
pkgver="0.1.5"
pkgrel=1
pkgdesc="A simple ruby version manager for fish"
url="https://github.com/terlar/fry"
arch=('any')
license=('MIT')
depends=('fish')
makedepends=()
provides=('fry')
conflicts=('fry-git')
install=${pkgname}.install
source=(https://github.com/terlar/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('5700e01ff4fe41fcfa307af42e8ec843b4be39adc7c8b227ebc73d372aa05c43')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mv share/fry share/fish
  make PREFIX="${pkgdir}/usr" install >/dev/null
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

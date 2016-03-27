pkgname=libuecc
arch=(i686 x86_64)
pkgver=7
pkgrel=1
pkgdesc="Very small Elliptic Curve Cryptography library"
makedepends=('cmake')
url="http://git.universe-factory.net/libuecc/"
license=('BSD')
source=("https://projects.universe-factory.net/attachments/download/85/${pkgname}-${pkgver}.tar.xz")
sha512sums=('44c5a00f578d301c1bffe8c2852912740f8af72ae6c2772cc263510df9b63d6b4ea15bd29215794c86d92fd797d18a078b97239ead0ad5238b1f976a6e2bcaa1')

build() {
  mkdir -p "$srcdir/build-${pkgver}"
  cd "$srcdir/build-${pkgver}"

  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr "../${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/build-${pkgver}"
  make install DESTDIR="${pkgdir}"
}

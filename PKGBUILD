# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml
pkgver=1.2.1
pkgrel=2
pkgdesc="Kolab XML Format Schema Definitions Library"
url='https://www.kolab.org/'
arch=('x86_64')
license=('GPL')
depends=('xerces-c' 'boost-libs')
makedepends=('cmake' 'boost' 'xsd' 'swig')
source=(https://cgit.kolab.org/libkolabxml/snapshot/libkolabxml-libkolabxml-$pkgver.tar.gz)
sha512sums=('a4967d84b57d4c637dcc36383f05dbb20fe2ba5e590235eac219ece33e15d29f5eb51e9501a4f9e277900fdec18ddd390e6dc564bf79663bb3513de07f04d39a')

build() {
  cmake -B build -S $pkgname-$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF \
    -DBoost_NO_BOOST_CMAKE=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

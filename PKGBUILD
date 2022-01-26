# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

pkgname=libvarnam
pkgver=3.2.6
pkgrel=1
pkgdesc="Transliteration and reverse transliteration for Indian languages"
arch=('x86_64')
url="https://www.varnamproject.com/"
license=('MPL')
makedepends=('cmake')
source=("https://github.com/varnamproject/libvarnam/releases/download/v3.2.6/$pkgname-$pkgver.tar.gz")
sha256sums=('17d856c6b2e1a3d009d9907e9d0b0a49d82f403e71a0307a9c11ba5681a35481')
depends=(
  'ruby'
  'ruby-ffi'
)
provides=('varnamc')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}


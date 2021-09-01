# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belcard
pkgver=5.0.13
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("belr>=$pkgver" 'gcc-libs')
makedepends=('cmake')
source=("belcard-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belcard/archive/$pkgver.tar.gz")
sha256sums=('1e8a9f9960f4e1a47c3cad169015495e879bb9f42452ad2a4a607953ffac5e41')

build() {
  cmake -B build -DCMAKE_PREFIX_PATH="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC=NO "$pkgname-$pkgver"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

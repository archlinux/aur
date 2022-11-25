# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belcard
pkgver=5.1.71
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("belr>=$pkgver" 'gcc-libs')
makedepends=('cmake')
source=("belcard-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belcard/archive/$pkgver.tar.gz")
sha256sums=('764c4774ed8f4b7bf47b7fdcfec232bc66ce97816cb456e957f29b2909ae5009')

build() {
  cmake -B build -DCMAKE_PREFIX_PATH="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC=NO "$pkgname-$pkgver"
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

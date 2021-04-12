# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=libcsys
pkgver=4.2.0
pkgrel=1
pkgdesc="Library for managing drive and getting system resource information in real time."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'udisks2')
makedepends=('cmake' 'ninja')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('1c976da273964a295822025941fbeb8c')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-v${pkgver} \
	-GNinja \
	-DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
	-DCMAKE_INSTALL_LIBDIR=${pkgdir}/usr/lib
  ninja
}

package() {
  cd build
  ninja install
}

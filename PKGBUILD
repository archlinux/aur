# Maintainer: Your Name <alex@ahpohl.com>
pkgname=libfronius
pkgver=0.1.3
pkgrel=1
pkgdesc="A C++ library to access Fronius inverters and smart meters"
arch=('x86_64' 'aarch64')
url="https://github.com/ahpohl/libfronius"
license=('MIT')
depends=('libmodbus' 'fmt')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/libfronius.git#tag=v${pkgver}")
sha256sums=('6e376251d9401d92ef730a72ff6cb9950a48b077def1c6c3c81f2a3ec4f1af53')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake --install build --prefix "${pkgdir}/usr"
}

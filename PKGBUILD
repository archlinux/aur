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
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/libsunspec.git#tag=v${pkgver}")
sha256sums=('bed54303df8525dedb12a556a31614420400ea7346b0a2fe481bbd6c1083e21b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake --install build --prefix "${pkgdir}/usr"
}

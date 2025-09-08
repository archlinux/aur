# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=bluray_info
pkgver=2.0
pkgrel=1
pkgdesc="Linux/BSD Blu-ray utilities - bluray_info, bluray_copy"
arch=('aarch64' 'x86_64')
license=('GPL-2.0-only')
url="https://github.com/beandog/bluray_info"
depends=('libaacs' 'libbluray')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7af484a6fa75389705620b1bcefd5f9334963b1edf3249441fb6512f09bc477a')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


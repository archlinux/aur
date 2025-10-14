# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=bluray_info
pkgver=2.1
pkgrel=1
pkgdesc="Linux/BSD Blu-ray utilities - bluray_info, bluray_copy"
arch=('aarch64' 'x86_64')
license=('GPL-2.0-only')
url="https://github.com/beandog/bluray_info"
depends=('libaacs' 'libbluray')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7ba88f52df3147feb3987c2e4b4fe81028ccc6e2e07465c9b24aa943e6aac9b8')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


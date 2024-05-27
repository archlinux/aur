# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=bluray_info
pkgver=1.14
pkgrel=1
pkgdesc="Linux/BSD Blu-ray utilities - bluray_info, bluray_copy"
arch=('aarch64' 'x86_64')
license=('GPL-2.0-only')
url="https://github.com/beandog/bluray_info"
depends=('libaacs' 'libbluray')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('002076a6940fff81a0beb4320f3a43ac20dbc0f3b9aead77df44c98a14bf1ec2')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


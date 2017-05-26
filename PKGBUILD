# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=syncit
pkgdesc='Sync files, directories or the entire file-system with durability in mind'
pkgver=0.0.2
pkgrel=1
arch=('any')
url='https://github.com/agherzan/syncit'
license=('APACHE')
depends=()
makedepends=()
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/agherzan/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5c8cbb3aca80812bdba7f171389a3d528ccdae0465a8379c9e84fb19ea5bb78e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DEST="${pkgdir}/usr/bin/"
  make INSTALL_DEST="${DEST}" install
}

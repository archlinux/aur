# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=syncit
pkgdesc='Sync files, directories or the entire file-system with durability in mind'
pkgver=0.0.1
pkgrel=2
arch=('any')
url='https://github.com/agherzan/syncit'
license=('APACHE')
depends=()
makedepends=()
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/agherzan/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c1a7336d4b3cc9aec04d747d39907e391840de4185bc9910a29c1afcaaaaf0f0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DEST="${pkgdir}/usr/bin/"
  install -d "${DEST}"
  make INSTALL_DEST="${DEST}" install
}

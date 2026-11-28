# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=taladb-bin
pkgver=0.13.3
pkgrel=1
pkgdesc="Embedded vector and document database for local-first AI applications"
arch=('x86_64')
url="https://github.com/taladb/taladb"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/taladb/taladb/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/taladb-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('58e11a20b7b3739f069c4705e9d7d5bd5cb9d34805572c8c6e996658f7f49ef4')
sha256sums_x86_64=('403c159a8411e2d48aa81edc9ce7a265afb26397cd01b25115993699fe9279e2')

package() {
  install -Dm755 "taladb" "${pkgdir}/usr/bin/taladb"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

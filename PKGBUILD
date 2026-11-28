# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chart-doc-gen-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Helm chart documentation generator"
arch=('x86_64' 'aarch64')
url="https://github.com/kubepack/chart-doc-gen"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kubepack/chart-doc-gen/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/chart-doc-gen-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/chart-doc-gen-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('cf85d3c7f075b6827240ed7511cbddb20f5f744035ecb2dbfcf702a02c72fde0')
sha256sums_aarch64=('ea3d8a96dba958c7fc19df70fc014307af94de9e694f275c051ef5da8d6a98b2')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/chart-doc-gen"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

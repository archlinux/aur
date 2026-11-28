# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mmar-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Self-hostable HTTP tunnel that exposes localhost on a public URL"
arch=('x86_64' 'aarch64')
url="https://github.com/yusuf-musleh/mmar"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mmar_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mmar_Linux_arm64.tar.gz")
sha256sums_x86_64=('8f8450fc47d76ec3774cc8f5dec442fda32ec88c836e78c8e101a5c52eeb8e55')
sha256sums_aarch64=('6e1b68d2b478a355ac51408aaf6ca2a2f1350e7951d402e227d8e5b5a51ee535')

package() {
  install -Dm755 "mmar" "${pkgdir}/usr/bin/mmar"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=khelm-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="Helm chart templating CLI and kustomize plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/mgoltzsche/khelm"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mgoltzsche/khelm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/khelm-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/khelm-linux-arm64")
sha256sums=('61ea4135304c0ff3a57a7286844a15a85065e52d4a933b9f836c46d5cd40c8e1')
sha256sums_x86_64=('70f6047de5985f319dbe0935ecf2c393890afccc2e78f2034111b28c1211c610')
sha256sums_aarch64=('da0d49a64c5addecce81d2f25c67f9e32a0ae54237a88ea1278687c109ed8d02')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/khelm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

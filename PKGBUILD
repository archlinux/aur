# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=opensca-cli-bin
pkgver=3.0.11
pkgrel=1
pkgdesc="Software supply chain scanner for dependencies, vulnerabilities and licenses"
arch=('x86_64' 'aarch64')
url="https://github.com/XmirrorSecurity/OpenSCA-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/XmirrorSecurity/OpenSCA-cli/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/opensca-cli-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/opensca-cli-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('429143f67facf5fa7eb3e00c4db5327db7ea44c7a4a8831a968887ceab1433c7')
sha256sums_x86_64=('69eb3924a01340825643ea5ad6e3bff2fc1e76830cbe9dbb35a28fd842eed65b')
sha256sums_aarch64=('5e8a5ec95c45a7c30e1cd6b5f03d2d736ce4fe41b60d6784edb0a8da6547541b')

package() {
  install -Dm755 "opensca-cli" "${pkgdir}/usr/bin/opensca-cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

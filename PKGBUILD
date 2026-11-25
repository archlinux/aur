# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=olares-bin
pkgver=1.12.8
pkgrel=1
pkgdesc="Open-Source Personal Cloud OS for Always-On Agents"
arch=('x86_64' 'aarch64')
url="https://github.com/beclab/Olares"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/beclab/Olares/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/olares-cli-v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/olares-cli-v${pkgver}_linux_arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('bbd6ba9d8bcb583c781f3c4c9fe057ef3a4e088149f86c4fb5202fcd0fe87d6b')
sha256sums_aarch64=('d85ca54bf56d4017a9c41df6bdb61af8b064efe67872febef4ac7eda2dba527f')

package() {
  install -Dm755 "olares-cli" "${pkgdir}/usr/bin/olares-cli"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Ret2Hell <ret2hell@users.noreply.github.com>

pkgname=jiratui-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Fast, local-first Jira TUI for daily sprint workflows"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/Ret2Hell/jiratui"
license=(MIT)
provides=(jiratui)
conflicts=(jiratui)
options=(!debug)

source=("LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/jiratui-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/jiratui-v${pkgver}-linux-arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/jiratui-v${pkgver}-linux-armv7.tar.gz")

sha256sums=('36cf4e83e979eab805898d24cf06ad161126286bce2c0203a4cd6ba610c11dc2')
sha256sums_x86_64=('e78b8daf8696871ba54cb8744c03a290783d7419583023b12d8c796aff78dbca')
sha256sums_aarch64=('33e53d58fef728ff15e987e1be82894bf2892b11ce5c03e468359392bf6996e2')
sha256sums_armv7h=('4099a2ab812b3d6a4e3fb9ba7a48439b2fe55e016032662f8cc13b04a23f951f')

package() {
  install -Dm755 "${srcdir}/jiratui" "${pkgdir}/usr/bin/jiratui"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

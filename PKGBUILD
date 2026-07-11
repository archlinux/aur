# Maintainer: Ret2Hell <ret2hell@users.noreply.github.com>

pkgname=jiratui-bin
pkgver=0.2.0
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
sha256sums_x86_64=('5c99fef2cbfd1d1eece8ed36ca6087501f3554395c91c496e278621a5e6b6a15')
sha256sums_aarch64=('60823efa1a66a9c7c1de816a213dae9194a15e1d6540d1878d5eb6eaa97c63db')
sha256sums_armv7h=('75ba2f21034e4ff828a4ec5cc4bc3d4770ec2ea9ea0b085d1d4312fca84389d3')

package() {
  install -Dm755 "${srcdir}/jiratui" "${pkgdir}/usr/bin/jiratui"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

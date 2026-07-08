# Maintainer: Ret2Hell <ret2hell@users.noreply.github.com>

pkgname=jiratui-bin
pkgver=0.1.1
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
sha256sums_x86_64=('baaef2271d0b8da9f7aaacbcbe47c92782f99595d7720543e3c7e4fc5dff0bb3')
sha256sums_aarch64=('8115255e3bc088bede1eeb251d7a4a998053f03985330581e69d56a6d5c39b35')
sha256sums_armv7h=('d453aabdc3a52cae98c35937b31a32b2baf37ff0534f760af930c0067cfc25af')

package() {
  install -Dm755 "${srcdir}/jiratui" "${pkgdir}/usr/bin/jiratui"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

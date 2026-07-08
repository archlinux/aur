# Maintainer: Ret2Hell <ret2hell@users.noreply.github.com>

pkgname=lazyjira-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast, local-first Jira TUI for daily sprint workflows"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/Ret2Hell/lazyjira"
license=(MIT)
provides=(lazyjira)
conflicts=(lazyjira)
options=(!debug)

source=("LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/lazyjira-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/lazyjira-v${pkgver}-linux-arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/lazyjira-v${pkgver}-linux-armv7.tar.gz")

sha256sums=('36cf4e83e979eab805898d24cf06ad161126286bce2c0203a4cd6ba610c11dc2')
sha256sums_x86_64=('58385437e241264df7e85cd79816193efad02493d6e732c74334e25f12516200')
sha256sums_aarch64=('c562160171a51cae7a8fb0cccfc884db0fbf2c7460139e62437412de1fc61e25')
sha256sums_armv7h=('330d36fa7a4b6bd5b8dcefcde8cfc058e5357c6316eea15db953dc60947bed69')

package() {
  install -Dm755 "${srcdir}/lazyjira" "${pkgdir}/usr/bin/lazyjira"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

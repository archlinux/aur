# Maintainer: Ret2Hell <ret2hell@users.noreply.github.com>

pkgname=jiratui-bin
pkgver=0.4.1
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
sha256sums_x86_64=('c0b2d139765b97caaf88070a76bc2a630b89f8006ba9326267295940a553a045')
sha256sums_aarch64=('41be6c8149ec31e6c0a3b84ec39b2a2caa162d9bfbf4b708bd7ea8832a951948')
sha256sums_armv7h=('f51b9fc0c12b747871bf60c3a68e7fa0d8f91d968138057cfe08b096a3a2dfb2')

package() {
  install -Dm755 "${srcdir}/jiratui" "${pkgdir}/usr/bin/jiratui"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

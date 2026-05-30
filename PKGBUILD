# Maintainer: Xuepoo Foter <foter@example.com>
pkgname=agent-book-translate-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="A powerful LLM-driven agentic EPUB book translator (binary release)"
arch=("x86_64" "aarch64")
url="https://github.com/Xuepoo/agent-book-translate"
license=("MIT")
depends=("sqlite" "openssl")
provides=("agent-book-translate")
conflicts=("agent-book-translate")

source_x86_64=("${pkgname}-x86_64-${pkgver}::https://github.com/Xuepoo/agent-book-translate/releases/download/v${pkgver}/agent-book-translate-linux-x86_64")
source_aarch64=("${pkgname}-aarch64-${pkgver}::https://github.com/Xuepoo/agent-book-translate/releases/download/v${pkgver}/agent-book-translate-linux-aarch64")

sha256sums_x86_64=('1d2d7bd455451935589d3ff0c8e4bf8f4de1ee6370896295d310c04b1e166650')
sha256sums_aarch64=('9845ff23297ca5170f962b2ccc46566b503549c6c36cd6ad505fceb39f591f7a')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-x86_64-${pkgver}" "${pkgdir}/usr/bin/agent-book-translate"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-aarch64-${pkgver}" "${pkgdir}/usr/bin/agent-book-translate"
  fi
}

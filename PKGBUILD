# Maintainer: Xuepoo Foter <foter@example.com>
pkgname=agent-book-translate-bin
pkgver=0.1.4
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

sha256sums_x86_64=('96e4e8cd5de0f1dfef8fa51932a7e54fe32359d58471eac580c40370ece2ec0a')
sha256sums_aarch64=('9a310614dc8ffdaa3c34c9456e3275c1a8464aa7c1347abf7017b4cc644b6959')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-x86_64-${pkgver}" "${pkgdir}/usr/bin/agent-book-translate"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-aarch64-${pkgver}" "${pkgdir}/usr/bin/agent-book-translate"
  fi
}

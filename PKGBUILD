# Maintainer: Xuepoo Foter <foter@example.com>
pkgname=agent-book-translate-bin
pkgver=0.1.1
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

sha256sums_x86_64=('cd39f1e01d995cf8aab7dfe50a78a5335a1c1a2aa0a3807fa2ac73a60612b23d')
sha256sums_aarch64=('32b63575db0b86dbcdbf1b35ca18bb5976e4b845c3ea434c8b5acb8e2fda90b7')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-x86_64-${pkgver}" "${pkgdir}/usr/bin/agent-book-translate"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-aarch64-${pkgver}" "${pkgdir}/usr/bin/agent-book-translate"
  fi
}

# Maintainer: Xuepoo Foter <foter@example.com>
pkgname=agent-book-translate-bin
pkgver=0.1.7
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

sha256sums_x86_64=('57a79ce34eaeb849512fee1119e1c1f6e052c9d8cbdc32fb437c2455de3718e3')
sha256sums_aarch64=('d4f4d5f4858fb5c39c31812c4b1f780cc7b7ee8403c96a4569845802c69485ea')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-x86_64-${pkgver}" "${pkgdir}/usr/bin/agent-book-translate"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-aarch64-${pkgver}" "${pkgdir}/usr/bin/agent-book-translate"
  fi
}

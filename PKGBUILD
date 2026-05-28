# Maintainer: Xuepoo Foter <foter@example.com>
pkgname=agent-book-translate-bin
pkgver=0.1.3
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

sha256sums_x86_64=('d5ae6c7dcee6f4d8cb38e1e6c55e7185c8d4f8e09442096f762618caa96172ff')
sha256sums_aarch64=('a2ac0f4557565f3ebe5d9672986e847478601366d4712b14bd601af3deb2eb65')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-x86_64-${pkgver}" "${pkgdir}/usr/bin/agent-book-translate"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${pkgname}-aarch64-${pkgver}" "${pkgdir}/usr/bin/agent-book-translate"
  fi
}

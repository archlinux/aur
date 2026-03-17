# Maintainer: eirikr <151315375+Oichkatzelesfrettschen@users.noreply.github.com>
# Why: Google AI Edge LiteRT-LM CLI for local on-device LLM inference.
#      v0.8.1 does not have an HTTP server mode; use 'litert run' for
#      interactive sessions and 'litert pull' to download models.

pkgname=litert-lm
pkgver=0.8.1
pkgrel=1
pkgdesc="Google AI Edge LiteRT-LM on-device LLM inference CLI (installed as litert)"
arch=('x86_64')
url="https://github.com/google-ai-edge/LiteRT-LM"
license=('Apache-2.0')
depends=()
# NOTE: /usr/bin/lit is taken by the llvm package (LLVM Integrated Tester).
#       The binary is installed as /usr/bin/litert to avoid the conflict.

# Asset name uses a dot separator: lit.linux_x86_64
# The '::' renames it locally so makepkg tracks it across pkgver bumps.
source=("lit-${pkgver}::https://github.com/google-ai-edge/LiteRT-LM/releases/download/v${pkgver}/lit.linux_x86_64"
        "LICENSE::https://raw.githubusercontent.com/google-ai-edge/LiteRT-LM/main/LICENSE")
sha256sums=('2b4582cdf6cacf098092388855b33be625301065e2c10f1bbf0d3c783491ef47'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
    install -Dm755 "${srcdir}/lit-${pkgver}" "${pkgdir}/usr/bin/litert"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

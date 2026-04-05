# Maintainer: Julian Corbet <julian.corbet@gmail.com>
pkgname=anythingllm-cli-bin
_pkgname=anything-llm-cli
pkgver=0.0.13
pkgrel=1
pkgdesc="CLI for chatting with your AnythingLLM instance from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/Mintplex-Labs/anything-llm-cli"
license=('unknown')
depends=('glibc')
optdepends=('anythingllm-desktop-bin: local AnythingLLM instance')
provides=('anythingllm-cli')
conflicts=('anythingllm-cli')
source_x86_64=("any-linux-x64-${pkgver}::https://github.com/Mintplex-Labs/${_pkgname}/releases/download/v${pkgver}/any-linux-x64")
source_aarch64=("any-linux-arm64-${pkgver}::https://github.com/Mintplex-Labs/${_pkgname}/releases/download/v${pkgver}/any-linux-arm64")
sha256sums_x86_64=('3c28d054bfc2f1d9393bb42b2d9addabe623a8cb511984bac7175997ae0ae8cc')
sha256sums_aarch64=('123471295b845c12d172b1c81d8009a8037babf27f3a6ae11f1f5bf3cf529b75')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/any-linux-x64-${pkgver}" "${pkgdir}/usr/bin/any"
    else
        install -Dm755 "${srcdir}/any-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/any"
    fi
}

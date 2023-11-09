# Maintainer: veggieTanuki <4d7orvu7@anonaddy.me>

pkgname=bws-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Bitwarden Secrets Manager CLI"
arch=("aarch64" "x86_64")
url="https://bitwarden.com/"
_get_license="$(mkdir -p src && curl -L "https://raw.githubusercontent.com/bitwarden/sdk/master/LICENSE" -o src/LICENSE)"
license=("custom:BITWARDEN SOFTWARE DEVELOPMENT KIT LICENSE AGREEMENT")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_aarch64=("https://github.com/bitwarden/sdk/releases/download/bws-v${pkgver//_/-}/bws-aarch64-unknown-linux-gnu-${pkgver}.zip")
source_x86_64=("https://github.com/bitwarden/sdk/releases/download/bws-v${pkgver//_/-}/bws-x86_64-unknown-linux-gnu-${pkgver}.zip")
sha512sums_aarch64=("3a6f8ee6cc821a57402c84a6e6a3fcd7cbdd6cdaf6457afdd16f84598a7e3098e230c376c89ad1ce509a0ab09d9a37720a5d7805ee5346bfca4fdc649da234bb")
sha512sums_x86_64=("9dcb4b10beb938298bbbe347fc6165c803abcafbccdd5b2d14301fa7137a77098293f3d763ab84be63fe9e7c4e270fbde96ca798db00e2de8a9e5ab686f33ec3")

package() {
    install -Dm755 bws "${pkgdir}/usr/bin/bws"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

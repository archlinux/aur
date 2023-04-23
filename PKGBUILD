# Maintainer: veggieTanuki <4d7orvu7@anonaddy.me>

pkgname=bws-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Bitwarden Secrets Manager CLI"
arch=("x86_64")
url="https://bitwarden.com/"
_get_license="$(mkdir -p src && curl -L "https://raw.githubusercontent.com/bitwarden/sdk/master/LICENSE" -o src/LICENSE)"
license=("custom:BITWARDEN SOFTWARE DEVELOPMENT KIT LICENSE AGREEMENT")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/bitwarden/sdk/releases/download/bws-v${pkgver//_/-}/bws-x86_64-unknown-linux-gnu-${pkgver}.zip")
sha512sums_x86_64=("02b947b89cdbf6926ff6e1da563b68177e61d875b2008f2c722d834220f66d1ac2abd2814fcfcebec6ee40415f46876fed8b42b3a8d3559c2045c1af8235e452")

package() {
    install -Dm755 bws "${pkgdir}/usr/bin/bws"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
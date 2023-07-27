# Maintainer: veggieTanuki <4d7orvu7@anonaddy.me>

pkgname=bws-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Bitwarden Secrets Manager CLI"
arch=("x86_64")
url="https://bitwarden.com/"
_get_license="$(mkdir -p src && curl -L "https://raw.githubusercontent.com/bitwarden/sdk/master/LICENSE" -o src/LICENSE)"
license=("custom:BITWARDEN SOFTWARE DEVELOPMENT KIT LICENSE AGREEMENT")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/bitwarden/sdk/releases/download/bws-v${pkgver//_/-}/bws-x86_64-unknown-linux-gnu-${pkgver}.zip")
sha512sums_x86_64=("df8320cf2256c394ab4d6c7d14a9315aa9ff68e8c9c4331f8dc551be26bf76e7f543fbc0dac171fb668bb52b187fc24104b1215be968893fc994894452b6eb24")

package() {
    install -Dm755 bws "${pkgdir}/usr/bin/bws"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
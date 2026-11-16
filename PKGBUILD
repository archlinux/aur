# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
pkgname=unifly-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="CLI + TUI for managing UniFi network controllers"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperb1iss/unifly"
license=('Apache-2.0')
provides=('unifly')
conflicts=('unifly')
depends=('gcc-libs' 'openssl' 'dbus')
install=unifly-bin.install

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/hyperb1iss/unifly/releases/download/v${pkgver}/unifly-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/hyperb1iss/unifly/releases/download/v${pkgver}/unifly-linux-arm64")

sha256sums_x86_64=('6746d9d15ef6f3d3f951a9a7306cff03c761f88b425b95f502c6e87d3d3e1718')
sha256sums_aarch64=('628ee95794d7d836237c280c110dfe8993c35e56e7a3c3a91695a11dbfcce974')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/unifly"
}

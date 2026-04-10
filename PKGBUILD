# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
pkgname=unifly-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="CLI + TUI for managing UniFi network controllers"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperb1iss/unifly"
license=('Apache-2.0')
provides=('unifly')
conflicts=('unifly')
depends=('gcc-libs' 'openssl' 'dbus')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/hyperb1iss/unifly/releases/download/v${pkgver}/unifly-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/hyperb1iss/unifly/releases/download/v${pkgver}/unifly-linux-arm64")

sha256sums_x86_64=('f8e9b2bd9a7b372874b7e9ac32c13b5b49f9fa724dbff8966d01cf1d3aaf4613')
sha256sums_aarch64=('894b4f72b3fb1c97a579c7ed2a83506eeeccd1295ceb4a613e8f7d3cb64dedcf')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/unifly"
}

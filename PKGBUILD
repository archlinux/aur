# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
pkgname=unifly-bin
pkgver=0.15.0
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

sha256sums_x86_64=('499c37fec104f906433859bddeb86c1674f89a054a00ca28c5de4371f28f5e54')
sha256sums_aarch64=('5ba533deb1e3f9e660dbe0543fc8d4d1f4fbaf5a193284b79e6228a7cb03c731')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/unifly"
}

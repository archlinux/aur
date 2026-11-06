# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
pkgname=unifly-bin
pkgver=0.12.1
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

sha256sums_x86_64=('0e7278994cfee7b94dfe0849a5cbeb68f3db4bd7bbeae54537723a6d07d7c2fd')
sha256sums_aarch64=('189ff60cd57f59285ab471876b8d70aae1d98e4885f67090d8ffbb667764690d')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/unifly"
}

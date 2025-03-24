# Maintainer: taotieren <admin@taotieren.com>

pkgname=ll-killer-go-bin
# _tagname=1.4.26
# pkgver="${_tagname//-/_}"
pkgver=1.4.33
pkgrel=1
pkgdesc="玲珑杀手 Go: 玲珑应用快速构建系统"
arch=(aarch64 x86_64 loong64)
url="https://github.com/System233/ll-killer-go"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
#replaces=(${pkgname%-bin})
depends=(
    glibc
)
optdepends=(
    'linyaps: Linglong is the container application toolkit of deepin.'
    'apt: Command-line package manager used on Debian-based systems'
    'apt-file: APT package searching utility'
)
makedepends=(
    git
    go
)
backup=()
options=('!strip' '!debug')
#install=${pkgname}.install
source=(
    "ll-killer-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/ll-killer-amd64"
    "ll-killer-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/ll-killer-arm64"
    "ll-killer-loong64-${pkgver}::${url}/releases/download/v${pkgver}/ll-killer-loong64"
    "LICENSE::https://github.com/System233/ll-killer-go/raw/refs/heads/main/LICENSE"

)
sha256sums=('6d679dfebf4caf5a7aacc707c0e5567d37223ca41d44c1b990d7b49e21500482'
            '0fa455e842d44ff4e0289f58255e774772a141d62bea4a2c2153e6167c0c2456'
            'ca06b12dd773e4d8f8994aad7e119d80464e9bb0d441a1f39e1c4b75394124a7'
            '687bf17b3dea772247820724ddbcb1a6dcb8ac48f9a85612d836b7ebfe11db36')

package() {
    install -Dm755 "${srcdir}/ll-killer-${CARCH}-${pkgver}" ${pkgdir}/usr/bin/ll-killer
    install -Dm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

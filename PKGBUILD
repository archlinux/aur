# Maintainer: taotieren <admin@taotieren.com>

pkgname=ll-killer-go-bin
# _tagname=1.4.26
# pkgver="${_tagname//-/_}"
pkgver=1.4.27
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
sha256sums=('94fdecdec205de963c450f65b34fa40de0cdf5feeadaa322bc4ab4ff039ec7ee'
            '81891eb2bbb7fff4f21eae7e67996b928313d24ecdfa5f299bfcd1d43b11c807'
            '59623d1bbe28443ebfcfa7cadf5c008194273103e558b165b5ce7227ecff5277'
            '687bf17b3dea772247820724ddbcb1a6dcb8ac48f9a85612d836b7ebfe11db36')

package() {
    install -Dm755 "${srcdir}/ll-killer-${CARCH}-${pkgver}" ${pkgdir}/usr/bin/ll-killer
    install -Dm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

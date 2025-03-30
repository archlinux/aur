# Maintainer: taotieren <admin@taotieren.com>

pkgname=ll-killer-go-bin
# _tagname=1.4.26
# pkgver="${_tagname//-/_}"
pkgver=1.5.3
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
sha256sums=('86413ba357e632899869f0c17946bd567d9f41973162f6aef57debad31a34a35'
            '9d4b724b766337fbc48e585ca4d5cc52a45c1143cd81159021a083eb9742c9df'
            '548b1108196f60a2543b4fda08249a9a9abe9b411350f64b6bd9b435badc56f0'
            '687bf17b3dea772247820724ddbcb1a6dcb8ac48f9a85612d836b7ebfe11db36')

package() {
    install -Dm755 "${srcdir}/ll-killer-${CARCH}-${pkgver}" ${pkgdir}/usr/bin/ll-killer
    install -Dm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

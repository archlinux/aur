# Maintainer: taotieren <admin@taotieren.com>

pkgname=ll-killer-go-bin
pkgver=1.4.21
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
sha256sums=('59d28ed5e86b66c3e7427f6ce0268e13f4693292d89cbec0f065795719a5bebf'
            '7d4a588204f11287c546a5856b0e74d1a5d53ccee0b6516c158828259cada753'
            'ccdaa3909bc4fe3dc6b79ea772e357e4d11a3db367e6eb0c494e79062eb08998'
            '687bf17b3dea772247820724ddbcb1a6dcb8ac48f9a85612d836b7ebfe11db36')

package() {
    install -Dm755 "${srcdir}/ll-killer-${CARCH}-${pkgver}" ${pkgdir}/usr/bin/ll-killer
    install -Dm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

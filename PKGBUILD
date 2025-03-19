# Maintainer: taotieren <admin@taotieren.com>

pkgname=ll-killer-go-bin
_tagname=1.4.23
pkgver="${_tagname//-/_}"
# pkgver=1.4.21
pkgrel=2
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
    "ll-killer-x86_64-${_tagname}::${url}/releases/download/v${_tagname}/ll-killer-amd64"
    "ll-killer-aarch64-${_tagname}::${url}/releases/download/v${_tagname}/ll-killer-arm64"
    "ll-killer-loong64-${_tagname}::${url}/releases/download/v${_tagname}/ll-killer-loong64"
    "LICENSE::https://github.com/System233/ll-killer-go/raw/refs/heads/main/LICENSE"

)
sha256sums=('4e9082e73bba789094a444102b4486ae738a4057243642a7743fa602964508b5'
            '64e35b75c37ee5f49e2250b6523244a9802b9134f66d6bdad0bf8b7a1c42ad32'
            '0b3dc2629c4b8e064c8c70dec6518df47e7013fc2d3249659b29b60dff088250'
            '687bf17b3dea772247820724ddbcb1a6dcb8ac48f9a85612d836b7ebfe11db36')

package() {
    install -Dm755 "${srcdir}/ll-killer-${CARCH}-${_tagname}" ${pkgdir}/usr/bin/ll-killer
    install -Dm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

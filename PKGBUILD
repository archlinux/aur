# Maintainer: taotieren <admin@taotieren.com>

pkgname=ll-killer-go-bin
_tagname=1.4.26
pkgver="${_tagname//-/_}"
# pkgver=1.4.21
pkgrel=3
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
sha256sums=('80049f26f00aa69af5be32917fe5a96a1e1ab9a2df424cc0b4bff7b59b317eee'
            'a3f5aee7614aa5c8bef1ab636b0b8350649be797d307b2a51973131ea1e2c2af'
            'e39bc399e9ac7f8e92bdc5498648d35a45a1711c9831c3b813265e49e3ef48d1'
            '687bf17b3dea772247820724ddbcb1a6dcb8ac48f9a85612d836b7ebfe11db36')

package() {
    install -Dm755 "${srcdir}/ll-killer-${CARCH}-${_tagname}" ${pkgdir}/usr/bin/ll-killer
    install -Dm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

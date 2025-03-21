# Maintainer: taotieren <admin@taotieren.com>

pkgname=ll-killer-go-bin
# _tagname=1.4.26
# pkgver="${_tagname//-/_}"
pkgver=1.4.28
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
sha256sums=('9e6eebde5f59ad65ab3621c2197702a697aa8183999e3266f8f69e9cb780335a'
            '78ffd4c4b8764813292a1e607be1934a2010d517c33ec1d0f38073a1d2db5131'
            'cdd7a0b184c7449a898afc516f300bdb90c7cb849129210a9f89c492f5eeb15b'
            '687bf17b3dea772247820724ddbcb1a6dcb8ac48f9a85612d836b7ebfe11db36')

package() {
    install -Dm755 "${srcdir}/ll-killer-${CARCH}-${pkgver}" ${pkgdir}/usr/bin/ll-killer
    install -Dm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

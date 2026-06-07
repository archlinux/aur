# Maintainer: Yustinia <yustinia@protonmail.com>
pkgname=kaiten-wall-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A wayland random wallpaper switcher that pulls from Wallhaven"
arch=('x86_64')
url="https://github.com/Yustinia/kaiten-wall"
license=('MIT')
depends=('awww')
optdepends=(
    'matugen: color scheme generation from wallpaper'
    'wallust: color scheme generation from wallpaper'
    )
provides=('kaiten-wall')
conflicts=('kaiten-wall' 'kaiten-wall-git')
source=(
    "kaiten::https://github.com/Yustinia/kaiten-wall/releases/download/v${pkgver}/kaiten-v${pkgver}"
    "LICENSE::https://raw.githubusercontent.com/Yustinia/kaiten-wall/refs/tags/v${pkgver}/LICENSE"
    )
sha256sums=('2d55c961797ea5573420e6714096b03b6bf8f210a5e5e77897b835e0421711fa'
            'b5f06d4368701fcac19f44fd37984f07faa4c0c387b29391d0245d97bd24f3c4')

package() {
    install -Dm755 "${srcdir}/kaiten" "${pkgdir}/usr/bin/kaiten"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

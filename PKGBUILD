# Maintainer: Yustinia <yustinia@protonmail.com>
pkgname=kaiten-wall-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="A wayland random wallpaper switcher that pulls from Wallhaven"
arch=('x86_64')
url="https://github.com/Yustinia/kaiten-wall"
license=('MIT')
depends=('awww')
options=('!debug')
optdepends=(
    'matugen: color scheme generation from wallpaper'
    'wallust: color scheme generation from wallpaper'
)
provides=('kaiten-wall')
conflicts=('kaiten-wall' 'kaiten-wall-git')
source=(
    "kaiten::https://github.com/Yustinia/kaiten-wall/releases/download/v${pkgver}/kaiten-x86_64"
    "LICENSE::https://raw.githubusercontent.com/Yustinia/kaiten-wall/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=('8e179b67acb03e1c94d7c49eb8ee6cbbd9910f730b2bc3c73f7eee91b1ec5c6c'
    'b5f06d4368701fcac19f44fd37984f07faa4c0c387b29391d0245d97bd24f3c4')

package() {
    install -Dm755 "${srcdir}/kaiten" "${pkgdir}/usr/bin/kaiten"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Daniela <pikalp32@gmail.com> | https://github.com/danielah05
# Contributor: Reylyer <reylyercross@gmail.com> | https://github.com/Reylyer

# Package name
pkgname=gamemaker-beta-bin

# Version
pkgver=2024.1100.0.700
pkgrel=1

# Generic
pkgdesc="Make a game with GameMaker, the best free video game engine. Perfect for beginners and professionals."
arch=('x86_64')
url="https://gamemaker.io"
license=('custom')

# Dependencies
depends=(
    'linuxdeploy'
    'appimagetool-bin'
    'clang'
    'openal'
    'unzip'
    'zip'
)

# Package relations
provides=('gamemaker-beta')
conflicts=('gamemaker-beta')

# Others
options=(!strip)

# Sources
# https://gms.yoyogames.com/GameMaker-Beta-2024.1100.0.700.deb
source=(
    "https://gms.yoyogames.com/GameMaker-Beta-${pkgver}.deb"
    "LICENSE.txt"    
)
sha256sums=(
    '1d0511dfd29729c5fcbd474fa4cdf02cd8d52822d6e77c405a9a4d8db1eae14c'
    '9ebe45546ac7bb43156c62f42947ccaf660f96cd4fcc684f42df49754aaeac51'
)

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

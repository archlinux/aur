# Maintainer: Daniela <pikalp32@gmail.com> | https://github.com/danielah05
# Contributor: Reylyer <reylyercross@gmail.com> | https://github.com/Reylyer

# Package name
pkgname=gamemaker-beta-bin

# Version
pkgver=2024.1400.1.926
pkgrel=1

# Generic
pkgdesc="Make a game with GameMaker, the best free video game engine. Perfect for beginners and professionals."
arch=('x86_64')
url="https://gamemaker.io"
license=('custom')

# Dependencies
depends=(
    'linuxdeploy'
    'obsolete-appimagetool-bin'
    'clang'
    'openal'
    'unzip'
    'zip'
    'gamemaker-steamruntime-sdk-bin'
)

# Package relations
provides=('gamemaker-beta')
conflicts=('gamemaker-beta')

# Others
options=(!strip)

# Sources
# https://gms.yoyogames.com/GameMaker-Beta-2024.1400.1.926.deb
source=(
    "https://gms.yoyogames.com/GameMaker-Beta-${pkgver}.deb"
    "LICENSE.txt"    
)
sha256sums=(
    'f05d15b84445e8b8a74f8b1e55d9bd2237c42db871b814032ada3131fef2b73c'
    '9ebe45546ac7bb43156c62f42947ccaf660f96cd4fcc684f42df49754aaeac51'
)

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# Maintainer: orca <thennothinghappened+aur@gmail.com> | https://github.com/thennothinghappened
# Contributor: Daniela <pikalp32@gmail.com> | https://github.com/danielah05
# Contributor: Reylyer <reylyercross@gmail.com> | https://github.com/Reylyer

# Package name
pkgname=gamemaker-lts2026-bin

# Version
pkgver=2026.0.0.16
pkgrel=1

# Generic
pkgdesc="Make a game with GameMaker, the best free video game engine. Perfect for beginners and professionals. For frequent updates, see gamemaker-beta-bin."
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
provides=('gamemaker-lts2026')
conflicts=('gamemaker-lts2026')

# Others
options=(!strip)

# Sources
# https://gms.yoyogames.com/GameMaker-LTS2026-2026.0.0.16.deb
source=(
    "https://gms.yoyogames.com/GameMaker-LTS2026-${pkgver}.deb"
    "LICENSE.txt"    
)
sha256sums=(
    '521db30a693a16baa7897005987124bea293a2bbcbe0a98edc258372ab1712b1'
    '9ebe45546ac7bb43156c62f42947ccaf660f96cd4fcc684f42df49754aaeac51'
)

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

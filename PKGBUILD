# Maintainer: Reylyer <reylyercross@gmail.com> | https://github.com/Reylyer

# Package name
pkgname=gamemaker-beta-bin

# Version
pkgver=2023.1100.0.450
pkgrel=1

# Generic
pkgdesc="Make a game with GameMaker, the best free video game engine. Perfect for beginners and professionals."
arch=('x86_64')
url="https://gamemaker.io"
license=('custom')

# Dependencies
depends=() # untested

# Package relations
provides=('gamemaker-beta')
conflicts=()

# Others
options=(!strip)

# Sources
# https://gms.yoyogames.com/GameMaker-Beta-2023.1100.0.450.deb
source=(
    "https://gms.yoyogames.com/GameMaker-Beta-${pkgver}.deb"
    "LICENSE.txt"    
)
sha256sums=(
    '33cb96561eb65becbcb9080da05157c56c1fd0327e4917d2a6d45fead0dd4bad'
    '9ebe45546ac7bb43156c62f42947ccaf660f96cd4fcc684f42df49754aaeac51'
)

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    ln -s '/opt/GameMaker-Beta/GameMaker' "${pkgdir}/usr/bin/GameMaker"

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
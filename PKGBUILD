# Contributor: Constantin Schomburg <me@xconstruct.net>
# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>

pkgname=mcpatcher3
_pkgname=mcpatcher
pkgver='3.0.4_01'
pkgrel=2
pkgdesc='Minecraft patcher to fix textures with higher than default resolution. For Minecraft 1.5.x.'
arch=('any')
license=('Public Domain')
url='https://bitbucket.org/prupe/mcpatcher'
depends=('java-runtime')
optdepends=('minecraft: the game itself')
noextract=("$_pkgname-$pkgver.jar")
changelog=ChangeLog
source=(https://bitbucket.org/prupe/mcpatcher/downloads/$_pkgname-$pkgver.jar
        mcpatcher3
        mcpatcher3.desktop)
md5sums=('99d9b43de9d6dece25c008df27e786ad'
         'd62667ccd36be3c31d1116e6ad5d70e2'
         'c9643983724cce746e24ffd16d0b7611')

prepare() {
    cd "$srcdir"

    # Extract icon
    bsdcpio --extract --make-directories 'resources/icon.png' < "$_pkgname-$pkgver.jar"
}

package() {
    cd "$srcdir"

    install -vDm755 'mcpatcher3'            "$pkgdir/usr/bin/mcpatcher3"
    install -vDm644 'resources/icon.png'    "$pkgdir/usr/share/pixmaps/mcpatcher3.png"
    install -vDm644 'mcpatcher3.desktop'    "$pkgdir/usr/share/applications/mcpatcher3.desktop"
    install -vDm644 "$_pkgname-$pkgver.jar" "$pkgdir/usr/share/$pkgname/mcpatcher.jar"
}

# vim:set ts=4 sw=4 et:

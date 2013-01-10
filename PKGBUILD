# Contributor: Constantin Schomburg <me@xconstruct.net>
# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>

pkgname=mcpatcher
pkgver='2.4.5_02'
pkgrel=1
pkgdesc='Minecraft patcher to fix textures with higher than default resolution'
arch=('any')
license=('Public Domain')
url='https://bitbucket.org/prupe/mcpatcher'
depends=('java-runtime')
optdepends=('minecraft: the game itself')
noextract=("$pkgname-$pkgver.jar")
changelog=ChangeLog
source=(mcpatcher
        mcpatcher.desktop
        https://bitbucket.org/prupe/mcpatcher/downloads/$pkgname-$pkgver.jar)
md5sums=('38358254be76dc84676509f43be44938'
         '87f031f8f0fceb0feb369c6185e07fbf'
         '2f3052f35beadf72cd5ee8592ab0976b')

build() {
    cd "$srcdir"

    # Extract icon
    bsdcpio --extract --make-directories 'resources/icon.png' < "$pkgname-$pkgver.jar"

    install -vDm755 'mcpatcher'            "$pkgdir/usr/bin/mcpatcher"
    install -vDm644 'resources/icon.png'   "$pkgdir/usr/share/pixmaps/mcpatcher.png"
    install -vDm644 'mcpatcher.desktop'    "$pkgdir/usr/share/applications/mcpatcher.desktop"
    install -vDm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/mcpatcher/mcpatcher.jar"
}

# vim:set ts=4 sw=4 et:

# Contributor: Constantin Schomburg <me@xconstruct.net>
# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>

pkgname=mcpatcher
pkgver='4.2.1'
pkgrel=1
pkgdesc='Minecraft patcher to fix textures with higher than default resolution'
arch=('any')
license=('Public Domain')
url='https://bitbucket.org/prupe/mcpatcher'
depends=('java-runtime')
optdepends=('minecraft: the game itself')
noextract=("$pkgname-$pkgver.jar")
changelog=ChangeLog
source=(https://bitbucket.org/prupe/mcpatcher/downloads/$pkgname-$pkgver.jar
        mcpatcher
        mcpatcher.desktop)
md5sums=('0a040cb24f503042801bd65a85f0c926'
         '9ec7aafefe59c2864b70f61d8661113d'
         '5bcaba0e9fbc3a22159c17a64c7688fd')

prepare() {
    cd "$srcdir"

    # Extract icon
    bsdcpio --extract --make-directories 'resources/icon.png' < "$pkgname-$pkgver.jar"
}

package() {
    cd "$srcdir"

    install -vDm755 'mcpatcher'            "$pkgdir/usr/bin/mcpatcher"
    install -vDm644 'resources/icon.png'   "$pkgdir/usr/share/pixmaps/mcpatcher.png"
    install -vDm644 'mcpatcher.desktop'    "$pkgdir/usr/share/applications/mcpatcher.desktop"
    install -vDm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/mcpatcher.jar"
}

# vim:set ts=4 sw=4 et:

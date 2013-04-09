# Contributor: Constantin Schomburg <me@xconstruct.net>
# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>

pkgname=mcpatcher2
_pkgname=mcpatcher
pkgver='2.4.5_04'
pkgrel=1
pkgdesc='Minecraft patcher to fix textures with higher than default resolution'
arch=('any')
license=('Public Domain')
url='https://bitbucket.org/prupe/mcpatcher'
depends=('java-runtime')
optdepends=('minecraft: the game itself')
noextract=("$_pkgname-$pkgver.jar")
changelog=ChangeLog
source=(https://bitbucket.org/prupe/mcpatcher/downloads/$_pkgname-$pkgver.jar
        mcpatcher2
        mcpatcher2.desktop)
md5sums=('c2c4e0327a6074209371953385108615'
         'f0f63af475d5d666395b9b41f59c9f5e'
         '9007f849ab95ccd7e62134b858b8618e')

build() {
    cd "$srcdir"

    # Extract icon
    bsdcpio --extract --make-directories 'resources/icon.png' < "$_pkgname-$pkgver.jar"

    install -vDm755 'mcpatcher2'            "$pkgdir/usr/bin/mcpatcher2"
    install -vDm644 'resources/icon.png'    "$pkgdir/usr/share/pixmaps/mcpatcher2.png"
    install -vDm644 'mcpatcher2.desktop'    "$pkgdir/usr/share/applications/mcpatcher2.desktop"
    install -vDm644 "$_pkgname-$pkgver.jar" "$pkgdir/usr/share/$pkgname/mcpatcher.jar"
}

# vim:set ts=4 sw=4 et:

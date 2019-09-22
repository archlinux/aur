# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

_pkgname=understand
pkgname=$_pkgname-bin
_pkgbuild=1000
pkgver=5.1.$_pkgbuild
pkgrel=1
pkgdesc="Static analysis tool for maintaining, measuring & analyzing critical or large code bases."
arch=('x86_64')
url="https://scitools.com/"
license=('custom')
depends=('libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'ncurses5-compat-libs')
options=('!strip')

source=("http://builds.scitools.com/all_builds/b$_pkgbuild/${_pkgname^}/${_pkgname^}-$pkgver-Linux-64bit.tgz"
"$_pkgname.desktop"
"$_pkgname")
md5sums=('b6975de562aa22e7e770e62c149a3570'
                '86ea741c38198d7291d5126ef0cd17f8'
                'bfcb2a7b5550e446939bae3e1a1165a8')


package() {
    install -d "$pkgdir/opt"
    cp -r "$srcdir/scitools" "$pkgdir/opt/"

    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$pkgdir/opt/scitools/bin/linux64/${_pkgname}_64.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}

# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

_pkgname=understand
pkgname=$_pkgname-bin
_pkgbuild=1237
pkgver=7.2.$_pkgbuild
pkgrel=1
pkgdesc="Static analysis tool for maintaining, measuring & analyzing critical or large code bases."
arch=('x86_64')
url="https://scitools.com/"
license=('custom')
depends=('libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'freetype2' 'libxcrypt-compat')
options=('!strip')

source=("https://s3.amazonaws.com/builds.scitools.com/all_builds/b${_pkgbuild}/${_pkgname^}/${_pkgname^}-$pkgver-Linux-64bit.tgz"
"$_pkgname.desktop"
"$_pkgname")
sha256sums=('f3d954dbabed4ad32cebbed21d805130c19608b79536be87cb9c8eb858aa9bcc'
            '8cb7852252e678b12a7d84b1ccb99bdae9e22f47793787be827cae98076957c9'
            '85ef433c24bbc0545552592cb342affa720a8f0fbe2dc6a5e488ee5cb054b0e6')

package() {
    install -d "$pkgdir/opt"
    cp -r "$srcdir/scitools" "$pkgdir/opt/"

    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$pkgdir/opt/scitools/bin/linux64/${_pkgname}_64.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}

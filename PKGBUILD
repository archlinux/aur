# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=xtool
_appimgfile="$_projectname.AppImage"
_licensefile="$_projectname-LICENSE"
_readmefile="$_projectname-README"
pkgname=$_projectname-appimage
pkgver=1.16.0
pkgrel=1
pkgdesc="Cross-platform Xcode replacement"
arch=("x86_64")
url="https://github.com/xtool-org/xtool"
license=("MIT")
depends=("swift-bin" "usbmuxd" "fuse2")
provides=($_projectname)
conflicts=($_projectname)
options=(!strip)
install="$pkgname.install"
source=("$_appimgfile::$url/releases/download/$pkgver/${_projectname}-x86_64.AppImage"
        "$_licensefile::https://raw.githubusercontent.com/xtool-org/$_projectname/refs/tags/$pkgver/LICENSE.md"
        "$_readmefile::https://raw.githubusercontent.com/xtool-org/$_projectname/refs/tags/$pkgver/README.md")
noextract=("$_appimgfile")
b2sums=('c5b30b85c84d938ab5085652081b05cc051b448c063f2f768ad69b96eeee16ac7c5706880325a242ced194d6e33ed3fb42f6cd8bd0074c92ae7e98a8e242c9d6'
        '7b9908cb9a09c9c46a6451879f40f94be28f699ffba00c3dd71f7496adb2fede6bbfd857eb4bb3f59c8464afa748f6da5a9fac0918a3b21fa579661ad0ab5d2b'
        'fe84d6d7ab47bbdb61c92499296edf996a0807a33c3a2b7b8410eabbc44049f3485a93568551633cf39246c577bc1a2a312886bacff974fcd2149255ba21d68e')

package() {
    install -Dm 755 "$_appimgfile" "$pkgdir/usr/bin/${_projectname}"
    install -Dm 644 "$_licensefile" "$pkgdir/usr/share/licenses/$_projectname/LICENSE.md"
    install -Dm 644 "$_readmefile" "$pkgdir/usr/share/doc/$_projectname/README.md"
}

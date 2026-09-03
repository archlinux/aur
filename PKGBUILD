# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=xtool
_appimgfile="$_projectname.AppImage"
_licensefile="$_projectname-LICENSE"
_readmefile="$_projectname-README"
pkgname=$_projectname-appimage
pkgver=1.18.1
pkgrel=1
pkgdesc="Cross-platform Xcode replacement"
arch=("x86_64")
url="https://github.com/xtool-org/xtool"
license=("MIT")
depends=("swift-bin" "usbmuxd" "fuse2" "zip")
provides=($_projectname)
conflicts=($_projectname)
options=(!strip)
install="$pkgname.install"
source=("$_appimgfile::$url/releases/download/$pkgver/${_projectname}-x86_64.AppImage"
        "$_licensefile::https://raw.githubusercontent.com/xtool-org/$_projectname/refs/tags/$pkgver/LICENSE.md"
        "$_readmefile::https://raw.githubusercontent.com/xtool-org/$_projectname/refs/tags/$pkgver/README.md")
noextract=("$_appimgfile")
sha256sums=('3acf674fea225fb84f91fd99f7a6d00450f354550074e427591c9e0304fa6067'
            '04cf87035e25606762ba596ec29ecac450a281f3d210a8042c91f49645c2e695'
            'a5ad69e621ea705d353b7b8afe89020eef782d2a5827a97b73022c349f5f42bc')

package() {
    install -Dm 755 "$_appimgfile" "$pkgdir/usr/bin/${_projectname}"
    install -Dm 644 "$_licensefile" "$pkgdir/usr/share/licenses/$_projectname/LICENSE.md"
    install -Dm 644 "$_readmefile" "$pkgdir/usr/share/doc/$_projectname/README.md"
}

# Maintainer: Reylyer <reylyercross@shariyl.cloud> | https://github.com/Reylyer
# With the help of Thomas <thomas@vypxl.io>

# Package name
_reponame=linuxdeploy
pkgname=$_reponame-appimage

# Version
_ver=1-alpha-20240109-1
pkgver=$(echo "$_ver" | sed 's/-/./g')                                                                                                                                                               
pkgrel=1

# Generic
pkgdesc="AppDir creation and maintenance tool."
arch=('x86_64')
url="https://github.com/linuxdeploy/linuxdeploy"
license=('MIT')

# Dependencies
depends=()

# Package relations
conflicts=("linuxdeploy")
provides=("linuxdeploy")

# Others
options=(!strip)

# Sources
_filename="$_reponame-$_ver.AppImage"
# https://github.com/linuxdeploy/linuxdeploy/releases/download/1-alpha-20240109-1/linuxdeploy-x86_64.AppImage
source=("$_filename::https://github.com/linuxdeploy/linuxdeploy/releases/download/$_ver/linuxdeploy-$CARCH.AppImage")
sha256sums=('c86d6540f1df31061f02f539a2d3445f8d7f85cc3994eee1e74cd1ac97b76df0')


package() {
    install -Dm755 $_filename $pkgdir/usr/bin/linuxdeploy
}
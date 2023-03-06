# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=outline-manager-appimage
pkgver=1.14.0
pkgrel=1
pkgdesc="Creates and manages Outline servers, powered by Shadowsocks."
arch=('x86_64')
url="https://github.com/Jigsaw-Code/outline-server"
license=('Apache')
makedepends=('git')
options=(!strip)
provides=('outline-manager')
conficts=('outline-manager')
# See https://github.com/Jigsaw-Code/outline-releases/blob/master/manager/latest-linux.yml
source=("Outline-Manager-v${pkgver}.AppImage::https://github.com/Jigsaw-Code/outline-server/releases/download/manager-v${pkgver}/Outline-Manager.AppImage")
sha256sums=('65dfa3bd3cf9e63668165b2102be63ecf50e3108dc4ae31f90b73f4b8042299b')

package() {
 install -Dm755 -t "$pkgdir/opt/outline-manager/" "$srcdir/Outline-Manager-v${pkgver}.AppImage"
 mkdir -p "$pkgdir/usr/bin"
 ln -sf "/opt/outline-manager/Outline-Manager-v${pkgver}.AppImage" "$pkgdir/usr/bin/outline-manager"
}

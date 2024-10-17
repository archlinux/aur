# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=outline-manager-appimage
pkgver=1.15.2
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
source=("Outline-Manager-v${pkgver}.AppImage::https://s3.amazonaws.com/outline-releases/manager/linux/${pkgver}/1/Outline-Manager.AppImage")
sha256sums=('ff6ffc93f734b01224cf950abb209056a692e38ce1b599a107cc53c1cbd94f1e')

package() {
 install -Dm755 -t "$pkgdir/opt/outline-manager/" "$srcdir/Outline-Manager-v${pkgver}.AppImage"
 mkdir -p "$pkgdir/usr/bin"
 ln -sf "/opt/outline-manager/Outline-Manager-v${pkgver}.AppImage" "$pkgdir/usr/bin/outline-manager"
}

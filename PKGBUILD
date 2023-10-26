# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=outline-manager-appimage
pkgver=1.15.1
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
source=("Outline-Manager-v${pkgver}.AppImage::https://s3.amazonaws.com/outline-releases/manager_linux/v${pkgver}/Outline-Manager.AppImage")
sha256sums=('c228a14dd32e6db186aa30e34c85d6f26415f52ae39b421fa3e11e39e48f202a')

package() {
 install -Dm755 -t "$pkgdir/opt/outline-manager/" "$srcdir/Outline-Manager-v${pkgver}.AppImage"
 mkdir -p "$pkgdir/usr/bin"
 ln -sf "/opt/outline-manager/Outline-Manager-v${pkgver}.AppImage" "$pkgdir/usr/bin/outline-manager"
}

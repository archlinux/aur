# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=outline-manager-appimage
pkgver=1.9.0
pkgrel=1
pkgdesc="Creates and manages Outline servers, powered by Shadowsocks."
arch=('x86_64')
url="https://github.com/Jigsaw-Code/outline-server"
license=('Apache')
makedepends=('git')
options=(!strip)
provides=('outline-manager')
conficts=('outline-manager')
source=("Outline-Manager-v${pkgver}.AppImage::https://github.com/Jigsaw-Code/outline-server/releases/download/v${pkgver}/Outline-Manager.AppImage")
sha256sums=('004a75eeab9d8f0881dca6612bbf47fef55cfaf4e72f29c735038807712e94b5')

package() {
 install -Dm755 -t "$pkgdir/opt/outline-manager/" "$srcdir/Outline-Manager-v${pkgver}.AppImage"
 mkdir -p "$pkgdir/usr/bin"
 ln -sf "/opt/outline-manager/Outline-Manager-v${pkgver}.AppImage" "$pkgdir/usr/bin/outline-manager"
}

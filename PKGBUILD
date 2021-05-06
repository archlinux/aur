# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=outline-manager-appimage
pkgver=1.8.1
pkgrel=1
pkgdesc="Creates and manages Outline servers, powered by Shadowsocks."
arch=('x86_64')
url="https://github.com/Jigsaw-Code/outline-server"
license=('Apache')
makedepends=('git')
options=(!strip)
provides=('outline-manager')
conficts=('outline-manager')
source=("https://github.com/Jigsaw-Code/outline-server/releases/download/v${pkgver/_/-}/Outline-Manager.AppImage")
b2sums=('b779f8cd3337a3d807e117b2a70f639826095f42a199552087abf7c888c8b1be2f30958c3e50c1c645785f2453940e8294fa253b43a6c0db726de6033094d4db')

package() {
 install -Dm755 -t $pkgdir/opt/outline-manager/ $srcdir/Outline-Manager.AppImage
 mkdir -p $pkgdir/usr/bin
 ln -sf /opt/outline-manager/Outline-Manager.AppImage $pkgdir/usr/bin/outline-manager
}

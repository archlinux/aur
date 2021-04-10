# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=outline-manager-appimage
pkgver=1.7.2
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
b2sums=('84c1f94d9f165385b30352b09f8fdef07a695213a4254695b23f39a95ae5a68962ff1079d605c70a9460152423bd6e567756b7d259b60d081de0c4894f0d0b21')

package() {
 install -Dm755 -t $pkgdir/opt/outline-manager/ $srcdir/Outline-Manager.AppImage
 mkdir -p $pkgdir/usr/bin
 ln -sf /opt/outline-manager/Outline-Manager.AppImage $pkgdir/usr/bin/outline-manager
}

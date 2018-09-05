# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Gui||aume <michaudg@gmail.com>

pkgname=rocketchat-client-bin
pkgver=2.13.0
pkgrel=1
pkgdesc="The Ultimate Open Source Web Chat Platform"
arch=('x86_64')
license=('The MIT License (MIT)')
url='https://rocket.chat'
depends=('gtk3' 'nss' 'gconf' 'libxss')
optdepends=('libnotify: For sending desktop notifications')
source=("https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/${pkgver}/rocketchat_${pkgver}_amd64.deb")
sha256sums=('002a6f6d45ca55e6bdcec17a8300af1cadb43f8612d749b68b7bd86cd26c3b92')

package() {
    cd "$srcdir"
    tar -xf data.tar.xz -C "$pkgdir"
    chmod -R go-w "$pkgdir"
    mkdir -m 755 -p "$pkgdir"/usr/bin
    ln -s /opt/Rocket.Chat/rocketchat "$pkgdir"/usr/bin
}

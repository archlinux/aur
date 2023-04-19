# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Gui||aume <michaudg@gmail.com>

pkgname=rocketchat-client-bin
pkgver=3.9.3
pkgrel=1
pkgdesc="The Ultimate Open Source Web Chat Platform"
arch=('x86_64')
license=('MIT')
url='https://rocket.chat'
depends=('gtk3' 'nss')
optdepends=('libnotify: For sending desktop notifications'
            'libindicator-gtk3: For the system tray icon')
provides=('rocketchat-desktop')
conflicts=('rocketchat-desktop')
source=("https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/$pkgver/rocketchat-$pkgver-linux-amd64.deb"
        'LICENSE')
sha256sums=('51be5ab18ac6e247a195443158940a01d05d02e77929ec09a2b3592a8986f9fc'
            '362e3ce451a4aa3e51e5728a2102b01135827d3a4af0a450b672c54540dec5c5')

package() {
    cd "$pkgdir"
    tar -xf "$srcdir"/data.tar.xz
    chmod -R go-w .
    mkdir -m 755 -p usr/bin
    ln -s ../../opt/Rocket.Chat/rocketchat-desktop usr/bin
    install -Dm644 "$srcdir"/LICENSE usr/share/licenses/"$pkgname"/LICENSE
}

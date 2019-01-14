# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Gui||aume <michaudg@gmail.com>

pkgname=rocketchat-client-bin
pkgver=2.14.7
pkgrel=1
pkgdesc="The Ultimate Open Source Web Chat Platform"
arch=('x86_64')
license=('MIT')
url='https://rocket.chat'
depends=('gtk3' 'nss' 'gconf' 'libxss')
optdepends=('libnotify: For sending desktop notifications')
source=("https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/${pkgver}/rocketchat_${pkgver}_amd64.deb"
        'LICENSE')
sha256sums=('81057d58fc87a78bc4fc69f38724a62d480d1756a3afa79c7e37e167cb3f7f0a'
            'SKIP')

package() {
    cd "$pkgdir"
    tar -xf "$srcdir"/data.tar.xz
    chmod -R go-w .
    mkdir -m 755 -p usr/bin
    ln -s ../../opt/Rocket.Chat/rocketchat-desktop usr/bin
    install -Dm644 "$srcdir"/LICENSE usr/share/licenses/"$pkgname"/LICENSE
}

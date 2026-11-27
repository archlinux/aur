# Maintainer: Coobyk <mail@coobyk.com>
pkgname=tdrive-bin
pkgver=0.3.8
pkgrel=2
pkgdesc="TDrive-compatible Telegram-backed cloud drive client — prebuilt binary"
arch=('x86_64')
url="https://github.com/Coobyk/tdrive"
license=('MIT')
depends=('fuse3' 'openssl' 'fontconfig' 'libxcb' 'libxkbcommon' 'wayland')
provides=('tdrive')
conflicts=('tdrive')
source=("tdrive-linux-x86_64-$pkgver.tar.gz::https://github.com/Coobyk/tdrive/releases/download/v$pkgver/tdrive-linux-x86_64-$pkgver.tar.gz")
sha256sums=('fa9b6213224c93b276781831bf4a333a8cf1abf8f2f3c260f489b561c8e59001')

package() {
    install -Dm755 "tdrive" "$pkgdir/usr/bin/tdrive"
    install -Dm644 packaging/tdrive.desktop "$pkgdir/usr/share/applications/tdrive.desktop"
    install -Dm644 packaging/tdrive.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tdrive.svg"
    for s in 256 128 64 48 32; do
        install -Dm644 "packaging/hicolor/tdrive-$s.png" \
            "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/tdrive.png"
    done
}

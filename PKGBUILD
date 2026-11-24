# Maintainer: Coobyk <mail@coobyk.com>
pkgname=tdrive-bin
pkgver=0.3.2
pkgrel=2
pkgdesc="TDrive-compatible Telegram-backed cloud drive client — prebuilt binary"
arch=('x86_64')
url="https://github.com/Coobyk/tdrive"
license=('MIT')
depends=('fuse3' 'openssl' 'fontconfig' 'libxcb' 'libxkbcommon' 'wayland')
provides=('tdrive')
conflicts=('tdrive')
source=("tdrive-linux-x86_64-$pkgver.tar.gz::https://github.com/Coobyk/tdrive/releases/download/v$pkgver/tdrive-linux-x86_64-$pkgver.tar.gz")
sha256sums=('878e45edcded6707de4d9368bba1ad9cd5d0ffe66d42df457ff2649201021ca0')

package() {
    install -Dm755 "tdrive" "$pkgdir/usr/bin/tdrive"
    install -Dm644 packaging/tdrive.desktop "$pkgdir/usr/share/applications/tdrive.desktop"
    install -Dm644 packaging/tdrive.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tdrive.svg"
    for s in 256 128 64 48 32; do
        install -Dm644 "packaging/hicolor/tdrive-$s.png" \
            "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/tdrive.png"
    done
}

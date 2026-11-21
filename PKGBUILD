# Maintainer: Coobyk <mail@coobyk.com>
pkgname=tdrive-bin
pkgver=0.1.3
pkgrel=2
pkgdesc="TDrive-compatible Telegram-backed cloud drive client — prebuilt binary"
arch=('x86_64')
url="https://github.com/Coobyk/tdrive-rs"
license=('MIT')
depends=('fuse3' 'openssl' 'fontconfig' 'libxcb' 'libxkbcommon' 'wayland')
provides=('tdrive')
conflicts=('tdrive')
source=("tdrive-rs-linux-x86_64-$pkgver.tar.gz::https://github.com/Coobyk/tdrive-rs/releases/download/v$pkgver/tdrive-rs-linux-x86_64-$pkgver.tar.gz")
sha256sums=('67d12822f6254e46f5d4066454c5bbc902f78f5bd6ef9ef84bffa41b6553809c')

package() {
    install -Dm755 "tdrive-rs" "$pkgdir/usr/bin/tdrive"
    install -Dm644 packaging/tdrive.desktop "$pkgdir/usr/share/applications/tdrive.desktop"
    install -Dm644 packaging/tdrive.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tdrive.svg"
    for s in 256 128 64 48 32; do
        install -Dm644 "packaging/hicolor/tdrive-$s.png" \
            "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/tdrive.png"
    done
}

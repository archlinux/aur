# Maintainer: Coobyk <mail@coobyk.com>
pkgname=tdrive-bin
pkgver=0.1.1
pkgrel=2
pkgdesc="TDrive-compatible Telegram-backed cloud drive client — prebuilt binary"
arch=('x86_64')
url="https://github.com/Coobyk/tdrive-rs"
license=('MIT')
depends=('fuse3' 'openssl' 'fontconfig' 'libxcb' 'libxkbcommon' 'wayland')
provides=('tdrive')
conflicts=('tdrive')
source=("tdrive-rs-linux-x86_64-$pkgver.tar.gz::https://github.com/Coobyk/tdrive-rs/releases/download/v$pkgver/tdrive-rs-linux-x86_64-$pkgver.tar.gz")
sha256sums=('04f90d3b11db2ad4c0919deab032fea50d10db5103c9156ed85245a58919e837')

package() {
    install -Dm755 "tdrive-rs" "$pkgdir/usr/bin/tdrive"
    install -Dm644 packaging/tdrive.desktop "$pkgdir/usr/share/applications/tdrive.desktop"
    install -Dm644 packaging/tdrive.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tdrive.svg"
    for s in 256 128 64 48 32; do
        install -Dm644 "packaging/hicolor/tdrive-$s.png" \
            "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/tdrive.png"
    done
}

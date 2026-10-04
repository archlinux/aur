# Maintainer: Mikkel Rask <mikkelrask@users.noreply.github.com>
pkgname=mango-layout-tray-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='A visual layout picker for MangoWM in your system tray (prebuilt binary)'
arch=('x86_64')
url='https://github.com/mikkelrask/mango-layout-tray'
license=('MIT')
depends=('gtk4>=4.8' 'glibc>=2.39' 'libgcc' 'wayland' 'glib2' 'cairo' 'hicolor-icon-theme')
optdepends=('mangowm: Wayland compositor controlled by this app')
provides=("mango-layout-tray=$pkgver")
conflicts=('mango-layout-tray')
options=('!debug')
source_x86_64=("$pkgname-$pkgver-$CARCH.tar.gz::$url/releases/download/v$pkgver/mango-layout-tray-$pkgver-linux-$CARCH.tar.gz")
sha256sums_x86_64=('f9a3c52e472495ace8be8ac87e5181d4cf9a4a5d799c8d9e3b158d7fd8840a92')

package() {
    install -Dm755 "$srcdir/bin/mango-layout-tray" "$pkgdir/usr/bin/mango-layout-tray"
    install -Dm755 "$srcdir/lib/mango-layout-tray/libgtk4-layer-shell.so.0" \
        "$pkgdir/usr/lib/mango-layout-tray/libgtk4-layer-shell.so.0"
    install -Dm644 "$srcdir/share/applications/mango-layout-tray.desktop" \
        "$pkgdir/usr/share/applications/mango-layout-tray.desktop"
    install -Dm644 "$srcdir/share/icons/hicolor/scalable/apps/mango-layout-tray.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/mango-layout-tray.svg"
    install -Dm644 "$srcdir/share/licenses/mango-layout-tray/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/share/licenses/mango-layout-tray/gtk4-layer-shell.LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/gtk4-layer-shell.LICENSE"
    install -d "$pkgdir/usr/share/doc/mango-layout-tray"
    cp -a "$srcdir/share/doc/mango-layout-tray/." "$pkgdir/usr/share/doc/mango-layout-tray/"
}

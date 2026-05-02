# Maintainer: Tamim Bhuyan <rxtamim30@gmail.com>
pkgname=focuslock
pkgver=1.0.11
pkgrel=1
pkgdesc="Lock a window fullscreen for focus sessions on KDE Wayland"
arch=('any')
url="https://github.com/Tamim180/focus_lock"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'qt5-tools'
    'kwin'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tamim180/focus_lock/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/focus_lock-$pkgver"

    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    # Single script goes directly to /usr/bin/focuslock
    install -m755 focuslock.py "$pkgdir/usr/bin/focuslock"

    install -m644 focuslock.desktop "$pkgdir/usr/share/applications/focuslock.desktop"
    install -m644 focuslock.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/focuslock.svg"
}

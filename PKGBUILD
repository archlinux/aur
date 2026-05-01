# Maintainer: Tamim Bhuyan <rxtamim30@gmail.com>
pkgname=focuslock
pkgver=1.0.6
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

    install -dm755 "$pkgdir/usr/lib/focuslock"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    # launcher.py goes directly to /usr/bin/focuslock — no shell script needed
    install -m755 launcher.py "$pkgdir/usr/bin/focuslock"

    # timer.py stays in /usr/lib/focuslock
    install -m755 timer.py "$pkgdir/usr/lib/focuslock/timer.py"

    install -m644 focuslock.desktop "$pkgdir/usr/share/applications/focuslock.desktop"
    install -m644 focuslock.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/focuslock.svg"
}

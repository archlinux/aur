# Maintainer: Abdulkadir Yildirim <contact@kadiryildirim.me>
pkgname=victus16-keyboard-ui
pkgver=1.0.3
pkgrel=1
pkgdesc="HP Victus 16 Keyboard RGB Backlight Controller (GTK4)"
arch=('any')
url="https://github.com/kadir-y/victus16-keyboard-ui"
license=('MIT')
depends=('python' 'gtk4' 'python-gobject')
install=victus16-keyboard.install

source=(
    "https://raw.githubusercontent.com/kadir-y/victus16-keyboard-ui/main/keyboard_controller.py"
    "https://raw.githubusercontent.com/kadir-y/victus16-keyboard-ui/main/com.victus16.keyboard.desktop"
    "https://raw.githubusercontent.com/kadir-y/victus16-keyboard-ui/main/victus16-keyboard-sudoers"
    "https://raw.githubusercontent.com/kadir-y/victus16-keyboard-ui/main/com.victus16.keyboard.png"
)

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/keyboard_controller.py" \
        "$pkgdir/usr/bin/victus16-keyboard"

    install -Dm644 "$srcdir/com.victus16.keyboard.desktop" \
        "$pkgdir/usr/share/applications/com.victus16.keyboard.desktop"

    install -Dm644 "$srcdir/com.victus16.keyboard.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.victus16.keyboard.png"

    install -Dm440 "$srcdir/victus16-keyboard-sudoers" \
        "$pkgdir/etc/sudoers.d/victus16-keyboard"
}

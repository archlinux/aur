# Maintainer: spaceslug <me at spaceslug dot no>
_base=mouse-actions
pkgname=$_base-gui-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="Use your mouse to execute commands, for X11 and Wayland. You can use gestures, hot corners and modifier keys. Mouse-actions is a mix between Easystroke and Compiz edge commands. This is the GUI version but you can still use CLI!"
arch=('x86_64')
url="https://github.com/jersou/$_base"
license=('MIT')
depends=(gtk3 webkit2gtk)
provides=($_base)
_filename=${_base}-gui-v${pkgver//_/-}.tar.gz
source=(
    "$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver//_/-}/${_filename}"
    "mouse_actions_logo.svg"
    "mouse-actions.desktop"
    "80-mouse-actions.rules"
)
sha256sums=(
    'e16a284c8291909399989cd72d5fabfd1f9f98cada9152186c1dde2ae76dfe14'
    '03fb24d88be86c6496a659568882ccd0086846e762704b58951cd72b9942b51e'
    '1522b3a2314c17f576214c93949916aee95740919ecc3838a9a32dc6f3f74dec'
    '27e69cdde6bcbb696b345efc7646c9be04357243dd8afa3f0a5c521d5cd87b1b'
)
install=mouse-actions.install

package() {
    install -Dm755 mouse-actions-gui "${pkgdir}/usr/bin/mouse-actions-gui"
    install -Dm644 mouse_actions_logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mouse-actions.svg"
    install -Dm644 mouse-actions.desktop "${pkgdir}/usr/share/applications/mouse-actions.desktop"
    install -Dm644 80-mouse-actions.rules "${pkgdir}/usr/lib/udev/rules.d/80-mouse-actions.rules"
}

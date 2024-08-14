# Maintainer: spaceslug <me at spaceslug dot no>
_base=mouse-actions
pkgname=$_base-cli-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="Use your mouse to execute commands, for X11 and Wayland. You can use gestures, hot corners and modifier keys. Mouse-actions is a mix between Easystroke and Compiz edge commands. This is the CLI only version!"
arch=('x86_64')
url="https://github.com/jersou/$_base"
license=('MIT')
depends=()
provides=($_base)
_filename=${_base}-v${pkgver}.tar.gz
source=(
    "$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${_filename}"
    "80-mouse-actions.rules"
)
sha256sums=(
    '7b5a4751c738e8dd8c82d04388d9922f00e4bcaec3649a96ab01e9cf0ad0ed2b'
    '27e69cdde6bcbb696b345efc7646c9be04357243dd8afa3f0a5c521d5cd87b1b'
)
install=mouse-actions.install

package() {
    install -Dm755 mouse-actions "${pkgdir}/usr/bin/mouse-actions"
    install -Dm644 80-mouse-actions.rules "${pkgdir}/usr/lib/udev/rules.d/80-mouse-actions.rules"
}

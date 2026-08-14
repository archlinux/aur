# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn-tui"
license=('MIT')
install=kvn-tui.install
depends=('gcc-libs' 'dbus' 'sing-box')
optdepends=(
    'wl-clipboard: clipboard integration on Wayland'
    'xclip: clipboard integration on X11 (preferred)'
    'xsel: clipboard integration on X11 (alternative)'
)
provides=('kvn-tui')
conflicts=('kvn-tui')
source=("https://github.com/yarikov/kvn-tui/releases/download/v0.21.0/kvn-tui-0.21.0-x86_64-linux.tar.gz")
sha256sums=('f510aa0a6e35fa0a8b722ce5ef87765bf99fb188240467947a5d7e75e29eb7a5')

package() {
    cd "kvn-tui-0.21.0-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 kvn-tui.service "$pkgdir/usr/lib/systemd/user/kvn-tui.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

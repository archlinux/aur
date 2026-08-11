# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.20.0
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
source=("https://github.com/yarikov/kvn-tui/releases/download/v0.20.0/kvn-tui-0.20.0-x86_64-linux.tar.gz")
sha256sums=('a6d538292295c26cde03b6cd5ba74cb207a08c5041b2b987c57e6740ebd13c9b')

package() {
    cd "kvn-tui-0.20.0-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    install -Dm644 kvn-tui.service "$pkgdir/usr/lib/systemd/user/kvn-tui.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

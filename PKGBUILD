# Maintainer: Henrik Bernhardt <57109108+Henriklmao@users.noreply.github.com>
pkgname=headset-tui
pkgver=0.2.0_2
pkgrel=1
pkgdesc='Waybar integration for HeadsetControl with an interactive TUI'
arch=('x86_64')
url='https://github.com/Henriklmao/headset-tui'
license=('GPL3')
depends=('headsetcontrol')
makedepends=('git' 'rust')
conflicts=('headset-tui-bin' 'headset-tui-git')
source=("$pkgname::git+https://github.com/Henriklmao/headset-tui.git#tag=v0.2.0-2")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$srcdir/target/release/headset-tui" "$pkgdir/usr/bin/headset-tui"
    install -Dm755 "install-waybar-config.sh" "$pkgdir/usr/share/headset-tui/install-waybar-config.sh"
}

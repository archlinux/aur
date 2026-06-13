# Maintainer: Jotalea <main@jotalea.com.ar>
pkgname=oxicord-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Vim-native Discord TUI for terminal enthusiasts. Instant navigation (jk/gG), smart follow mode, infinite history scrolling, and image support."
arch=('x86_64' 'aarch64')
url="https://github.com/linuxmobile/oxicord"
license=('MIT')
depends=('dbus' 'glib2' 'chafa' 'openssl')
optdepends=('tmux: for running in background sessions')
provides=('oxicord')
conflicts=('oxicord')
source_x86_64=("oxicord-$pkgver-x86_64::https://github.com/linuxmobile/oxicord/releases/download/v$pkgver/oxicord-x86_64-unknown-linux-gnu")
source_aarch64=("oxicord-$pkgver-aarch64::https://github.com/linuxmobile/oxicord/releases/download/v$pkgver/oxicord-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('ce0ab0085a897d08eaf0ce0e71e679e1544b91e227efdd64ac922520699adfd2')
sha256sums_aarch64=('6d34867a0de22eda904edf196ff7da0162d557a86f1ff2c9503f4b2dd228acaf')

prepare() {
    # Rename files for easier handling
    mv "$srcdir/oxicord-$pkgver-$CARCH" "$srcdir/oxicord" 2>/dev/null || true
}

package() {
    # Install binary
    install -Dm755 "$srcdir/oxicord" "$pkgdir/usr/bin/oxicord"
}

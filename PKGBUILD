# Maintainer: Jotalea <main@jotalea.com.ar>
pkgname=oxicord-bin
pkgver=0.1.7
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
sha256sums_x86_64=('24e547f7bcade4abd1aedc566cf96222d462fec167de012a13fe6dc521172995')
sha256sums_aarch64=('97127667298834eee53b0175d2da914dca59b9a3abfbf253d3908f0567ec962d')

prepare() {
    # Rename files for easier handling
    mv "$srcdir/oxicord-$pkgver-$CARCH" "$srcdir/oxicord" 2>/dev/null || true
}

package() {
    # Install binary
    install -Dm755 "$srcdir/oxicord" "$pkgdir/usr/bin/oxicord"
}
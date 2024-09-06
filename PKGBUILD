# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=neocities-zig-bin
_pkgname=${pkgname%-zig-bin}
pkgver=0.1.2
pkgrel=1
pkgdesc="A command-line client for Neocities written in Zig."
arch=('x86_64' 'aarch64')
url="https://github.com/ratakor/$_pkgname-zig"
license=('ISC')
provides=("$_pkgname" "$_pkgname-zig")
conflicts=("$_pkgname" "$_pkgname-zig")
source=("$url/releases/download/$pkgver/$CARCH-linux-$_pkgname"
        "$url/raw/master/_$_pkgname")
sha256sums=('SKIP' 'SKIP')

package() {
	install -Dm755 "$CARCH-linux-$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

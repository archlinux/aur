# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=nk-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.0
pkgrel=1
pkgdesc="A command-line client for Nekoweb"
arch=('x86_64' 'aarch64')
url="https://github.com/ratakor/$_pkgname"
license=('ISC')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$CARCH-linux-nekoweb"
        "$url/raw/master/_$_pkgname")
sha256sums=('SKIP' 'SKIP')

package() {
	install -Dm755 "$CARCH-linux-nekoweb" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

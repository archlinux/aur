# Maintainer: Luc <luc@dougy147.com>
pkgname=mcbash
pkgver=0.4.r95.85a11f7
pkgrel=1
epoch=
pkgdesc="scan for valid MAC addresses on Stalker Portal servers"
arch=(x86_64 i686)
url="https://github.com/dougy147/mcbash.git"
license=('GPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(mcbash)
conflicts=()
replaces=()
backup=()
options=()
install=post_install.install
changelog=
source=("${pkgname}::git+${url}")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/$pkgname" || exit
	printf "0.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D -m755 "$srcdir/$pkgname/bin/mcbash" "$pkgdir/usr/bin/mcbash"
	install "$srcdir/$pkgname/post_install.install" "$pkgdir/tmp/post_install.install"
	install -D -m644 "$srcdir/$pkgname/mcbash.1" "$pkgdir/usr/share/man/man1/mcbash.1"
	install -D -m644 "$srcdir/$pkgname/mcbash.conf" "$pkgdir/etc/mcbash.conf"
}

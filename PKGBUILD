# Maintainer: dougy147 <luc@dougy147.com>
pkgname=mcbash
pkgver=0.4.9
pkgrel=1
pkgdesc="scan for valid MAC addresses on Stalker Portal servers"
arch=(x86_64 i686)
url="https://github.com/dougy147/mcbash.git"
license=('GPL')
depends=()
makedepends=(git)
checkdepends=()
provides=(mcbash)
install=post_install.install
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

package() {
	install -D -m755 "$srcdir/$pkgname/bin/mcbash" "$pkgdir/usr/bin/mcbash"
	install -D -m755 "$srcdir/$pkgname/post_install.install" "$pkgdir/tmp/post_install.install"
	install -D -m644 "$srcdir/$pkgname/mcbash.1" "$pkgdir/usr/share/man/man1/mcbash.1"
	install -D -m644 "$srcdir/$pkgname/mcbash.conf" "$pkgdir/etc/mcbash.conf"
}

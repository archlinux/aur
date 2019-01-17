# Maintainer: Dr-Noob <peibolms at gmail dot com>
_name=snetscan
pkgname="$_name-git"
pkgver=0.1
pkgrel=1
pkgdesc="Command line network scanner"
arch=('x86_64')
url="https://github.com/Dr-Noob/snetscan"
license=('MIT')
depends=('libnet' 'libpcap')
makedepends=('git' 'wget')
source=("git+https://github.com/Dr-Noob/snetscan")
md5sums=('SKIP')

build() {
	cd "$srcdir/$_name"
	make
}

package() {
	cd "$srcdir/$_name"
	install -Dm755 "snetscan"   "$pkgdir/usr/bin/snetscan"
        install -dm755              "$pkgdir/usr/share/snetscan"
        install -Dm644 "macdb.csv"  "$pkgdir/usr/share/snetscan"
        install -Dm644 "LICENSE"    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 "snetscan.8" "$pkgdir/usr/share/man/man8/snetscan.8.gz"
}

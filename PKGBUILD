# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Markus Volkmann <mcfock@counterstrike.de>

pkgname=etherwake
pkgver=1.09
pkgrel=5
arch=(i686 x86_64)
pkgdesc="Utility for waking up computers via wake-on-lan (wol)"
license="GPL"
url="http://www.scyld.com/wakeonlan.html"
source=(https://launchpad.net/ubuntu/+archive/primary/+files/etherwake_1.09.orig.tar.gz)

build() {
	cd "$srcdir/$pkgname-$pkgver.orig"
	rm -f etherwake etherwake.8.gz
	gcc ether-wake.c -o etherwake
	gzip etherwake.8
}

package() {
	cd "$srcdir/$pkgname-$pkgver.orig"
	install -Dm0755 etherwake "$pkgdir/usr/sbin/etherwake"
	install -Dm0644 etherwake.8.gz "$pkgdir/usr/share/man/man8/etherwake.8"
}

md5sums=('628e8b2a28d47f262e4c26c989402a59')

# Maintainer: Korbinian Schildmann <aur@schildmann.net>

pkgbase=freeman-korbi-bin
pkgname=(freeman-korbi-bin)
pkgver=0.2.269
pkgrel=1
pkgdesc="freeman"
makedepends=('git' 'tar')
arch=('x86_64')
license=('GPL3')
options=(!strip)
source=("http://git.int.schildmann.net/kschildmann/freeman/uploads/1990a245b6066afe1d53065671f0d5a2/freeman.tar.gz")
sha256sums=('SKIP')

package() {
	tar -xvf freeman.tar.gz -C "$srcdir"

	mkdir -p $pkgdir/usr/bin/
	install -m 755 $srcdir/freeman $pkgdir/usr/bin/freeman

	mkdir -p $pkgdir/etc/
	install -m 644 $srcdir/freeman.json $pkgdir/etc/freeman.json

	mkdir -p $pkgdir/etc/freeman.d/
	install -m 644 $srcdir/freeman.d/* $pkgdir/etc/freeman.d/

}

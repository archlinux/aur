# Maintainer: Korbinian Schildmann <aur@schildmann.net>

pkgbase=freeman-korbi-bin
pkgname=(freeman-korbi-bin)
pkgver=0.2.178
pkgrel=1
pkgdesc="freeman"
makedepends=('git' 'tar')
arch=('any')
license=('GPL3')
options=(!strip)
source=("http://git.int.schildmann.net/kschildmann/freeman/uploads/5a417695fce95a597bc85e13af0efaba/freeman.tar.gz")
sha256sums=('5c14eae07f63f29b5834aef397e515d6f9db898789de37992301fb9fd24ef231')

package() {
	tar -xvf freeman.tar.gz -C "$pkgdir"

	mkdir -p $pkgdir/usr/bin/
	install -m 755 $pkgdir/freeman $pkgdir/usr/bin/freeman

	mkdir -p $pkgdir/etc/
	install -m 644 $pkgdir/freeman.json $pkgdir/etc/freeman.json

	mkdir -p $pkgdir/etc/freeman.d/
	install -m 644 $pkgdir/freedom $pkgdir/etc/freeman.d/freedom

}

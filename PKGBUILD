# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=nona
pkgver=2014.03.10
pkgrel=6
pkgdesc="NONA: a bastard son of Pee-Wee. Phylogenetic Analysis Software"
arch=('any')
url="http://www.lillo.org.ar/phylogeny/Nona-PeeWee/readme.htm"
depends=('lib32-glibc')
license=('custom')
source=("http://www.lillo.org.ar/phylogeny/Nona-PeeWee/nona-linux.tar.gz")
sha256sums=('40698b797a3d58707521dd3cea0ebdf3f80ff5c1075382f98b81860fc426de69')
prepare() {
	cd $srcdir
	echo -e '#!/bin/bash\n cd /usr/share/nona/\n./nona' > shell-$pkgname
	chmod +x shell-$pkgname
}
package() {
	# install dir 
	install -dm755 "$pkgdir"/usr/{bin,share/{$pkgname,doc/$pkgname}}
	# install them
	install -Dm755 $srcdir/piwe.doc $pkgdir/usr/share/$pkgname/piwe.doc
	install -Dm755 $srcdir/$pkgname $pkgdir/usr/share/$pkgname/$pkgname
	install -Dm755 $srcdir/shell-$pkgname $pkgdir/usr/bin/$pkgname-linux 
	# link
	ln -s /usr/share/$pkgname/piwe.doc $pkgdir/usr/share/doc/$pkgname/piwe.doc
}

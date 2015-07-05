# Contributor: henning mueller <henning@orgizm.net>

pkgname=sispread
pkgver=2005.10.04
_pkgver=2005-10-04
pkgrel=1
pkgdesc="Simulation of Infectious Spreading"
arch=(i686 x86_64)
license=(GPL)
url=http://sispread.sourceforge.net/
depends=()
source=(
	http://prdownloads.sourceforge.net/sispread/sispread-$_pkgver.tar.bz2 \
	http://prdownloads.sourceforge.net/sispread/manual_sispread-$_pkgver.pdf \
	http://prdownloads.sourceforge.net/sispread/quickcardsispread-$_pkgver.pdf
)
md5sums=(
	b5efbf2feb7def01c662b0630c330dbe
	435fafa71788d5855a3719071846ab42
	0eb6d2fcc55d7c1ef1e9077d2a2c810b
)

build() {
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	cp *.pdf $pkgdir/usr/share/doc/$pkgname

	cd $srcdir/$pkgname-$_pkgver
	make

	install -D $pkgname $pkgdir/usr/bin/$pkgname
}

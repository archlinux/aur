# Maintainer: Chris Kitching <chriskitching@linux.com>
# Author: "Lucy" https://github.com/lucy

pkgname=perl-getopt-tabular
pkgver=0.3
pkgrel=1
pkgdesc="Table-driven argument parsing"
arch=('any')
url="http://search.cpan.org/search?query=Getopt-Tabular"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/G/GW/GWARD/Getopt-Tabular-$pkgver.tar.gz")
sha256sums=('9bdf067633b5913127820f4e8035edc53d08372faace56ba6bfa00c968a25377')

build() {
	cd "$srcdir/Getopt-Tabular-$pkgver"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "$srcdir/Getopt-Tabular-$pkgver"
	make install DESTDIR=$pkgdir
	find $pkgdir -name '.packlist' -delete
	find $pkgdir -name '*.pod' -delete
}

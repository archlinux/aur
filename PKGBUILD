# Maintainer: Chris Kitching <chriskitching@linux.com>
# Author: "Lucy" https://github.com/lucy

pkgname=perl-benchmark-timer
pkgver=0.7107
pkgrel=1
pkgdesc="Perl code benchmarking tool"
arch=('any')
url="http://search.cpan.org/dist/Benchmark-Timer"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCOPPIT/Benchmark-Timer-$pkgver.tar.gz")
sha256sums=('64f70fabc896236520bfbf43c2683fdcb0f2c637d77333aed0fd926b92226b60')

build() {
	cd "$srcdir/Benchmark-Timer-$pkgver"
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "$srcdir/Benchmark-Timer-$pkgver"
	make install DESTDIR=$pkgdir
	find $pkgdir -name '.packlist' -delete
	find $pkgdir -name '*.pod' -delete
}

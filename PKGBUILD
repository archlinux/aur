# Contributor: Chris Kitching <chriskitching@linux.com>
# Contributor: "Lucy" https://github.com/lucy

pkgname=perl-benchmark-timer
pkgver=0.7112
pkgrel=1
pkgdesc="Perl code benchmarking tool"
arch=('any')
url="http://search.cpan.org/dist/Benchmark-Timer"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-uri' 'perl-module-install')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCOPPIT/Benchmark-Timer-$pkgver.tar.gz")
sha256sums=('0278447d9ad9d773d59a4ebd6db8afeadde81c8fa5d6a8738f5e7d578e2a402e')

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

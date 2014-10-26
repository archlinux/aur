# CPAN Name  : PDL::IO::HDF5
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-pdl-io-hdf5
pkgver=0.6501
pkgrel=1
pkgdesc='Perl module providing PDL interface to the HDF5 data format'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/PDL-IO-HDF5'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-pdl>=2.007'
	'hdf5'
)

source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHM/PDL-IO-HDF5-0.6501.tar.gz)
options=(!emptydirs)
md5sums=('8316e29979e5bea41302785aa8f5ea3e')

build() {
	cd PDL-IO-HDF5-0.6501
	F77LIBS='-lgfortran -lm' PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor PDLCONF=$srcdir/perldl.conf
	make
}

check() {
	cd PDL-IO-HDF5-0.6501
	make test
}

package() {
	cd PDL-IO-HDF5-0.6501
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# CPAN Name  : ExtUtils::F77
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-extutils-f77
pkgver=1.26
pkgrel=1
pkgdesc='Perl module providing simple interface to F77 libraries'
arch=('any')
url='https://metacpan.org/release/ExtUtils-F77'
license=('PerlArtistic' 'GPL')
depends=('perl-file-which' 'gcc-fortran')
source=(http://search.cpan.org/CPAN/authors/id/E/ET/ETJ/ExtUtils-F77-1.26.tar.gz)
options=(!emptydirs)
md5sums=('06e142e823e6f60a1d4aa711f45c2f79')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd ExtUtils-F77-1.26
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd ExtUtils-F77-1.26
	sanitize
	make test
}

package() {
	cd ExtUtils-F77-1.26
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

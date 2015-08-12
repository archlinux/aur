# CPAN Name  : ExtUtils::F77
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-extutils-f77
pkgver=1.18
pkgrel=1
pkgdesc='Perl module providing simple interface to F77 libraries'
arch=('any')
url='https://metacpan.org/release/ExtUtils-F77'
license=('PerlArtistic' 'GPL')
depends=('perl' 'gcc-fortran')
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHM/ExtUtils-F77-1.18.tar.gz)
options=(!emptydirs)
md5sums=('7a9abbf3c68b96a44a2e0875a0663412')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd ExtUtils-F77-1.18
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd ExtUtils-F77-1.18
	sanitize
	F77LIBS='-lgfortran -lm' make test
}

package() {
	cd ExtUtils-F77-1.18
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

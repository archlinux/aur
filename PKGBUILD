# CPAN Name  : PkgConfig
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-pkgconfig
pkgver=0.09026
pkgrel=1
pkgdesc='Pure-Perl Core-only replacement for pkg-config'
arch=('any')
url='https://metacpan.org/release/PkgConfig'
license=('GPL' 'PerlArtistic')
options=(!emptydirs)
depends=('perl>=5.11.3')
source=(http://search.cpan.org/CPAN/authors/id/P/PL/PLICEASE/PkgConfig-0.09026.tar.gz)
md5sums=('bc920c8da68dcb85c0ab385490a2462f')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd PkgConfig-0.09026
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd PkgConfig-0.09026
	sanitize
	make test
}

package() {
	cd PkgConfig-0.09026
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

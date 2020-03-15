# CPAN Name  : Alien::GSL
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-alien-gsl
pkgver=1.01
pkgrel=1
pkgdesc='Building, finding and using GSL library'
arch=('any')
url='https://metacpan.org/release/Alien-GSL'
license=('PerlArtistic' 'GPL')
makedepends=('perl-module-build>=0.38' 'perl-alien-base-modulebuild')
depends=('perl-alien-build' 'gsl')
source=(http://search.cpan.org/CPAN/authors/id/J/JB/JBERGER/Alien-GSL-1.01.tar.gz)
options=(!emptydirs)
md5sums=('7d7aa5fc9e3e28bebdecb991fdfd5882')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Alien-GSL-1.01
	sanitize
	/usr/bin/perl Build.PL --installdirs vendor --destdir "$pkgdir"
	/usr/bin/perl Build
}

check() {
	cd Alien-GSL-1.01
	sanitize
	/usr/bin/perl Build test
}

package() {
	cd Alien-GSL-1.01
	sanitize
	/usr/bin/perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

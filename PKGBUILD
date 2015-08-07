# CPAN Name  : Math::GSL
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-math-gsl
pkgver=0.35
pkgrel=1
pkgdesc='Perl module providing interface to the GNU Scientific Library'
arch=('i686' 'x86_64')
url='https://metacpan.org/release/Math-GSL'
license=('GPL')
options=(!emptydirs)
depends=('perl' 'gsl')
makedepends=('perl-module-build')
checkdepends=('perl-test-exception' 'perl-test-class' 'perl-test-most' 'perl-test-taint')
source=(http://search.cpan.org/CPAN/authors/id/A/AM/AMBS/Math-GSL-0.35.tar.gz)
md5sums=('b7d4cdb617db449a6d955e9aeeddb0aa')

build() {
	cd Math-GSL-0.35
	PERL_MM_USE_DEFAULT=1 perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd Math-GSL-0.35
	perl Build test
}

package() {
	cd Math-GSL-0.35
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

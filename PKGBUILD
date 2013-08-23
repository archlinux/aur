# CPAN Name  : Math::GSL
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname=perl-math-gsl
pkgver=0.27
pkgrel=1
pkgdesc='Perl module providing interface to the GNU Scientific Library'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Math-GSL'
license=('GPL')
options=(!emptydirs)
depends=('perl' 'gsl')
makedepends=('perl-extutils-pkgconfig')
checkdepends=('perl-test-exception' 'perl-test-class' 'perl-test-most')
source=(http://search.cpan.org/CPAN/authors/id/L/LE/LETO/Math-GSL-0.27.tar.gz)
md5sums=('1a929dd3274d19217ed5696804c25b01')

build() {
  cd "$srcdir/Math-GSL-0.27"
  PERL_MM_USE_DEFAULT=1 perl Build.PL --installdirs vendor --destdir "$pkgdir"
  perl Build
}

check() {
  cd "$srcdir/Math-GSL-0.27"
  perl Build test
}

package() {
  cd "$srcdir/Math-GSL-0.27"
  perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

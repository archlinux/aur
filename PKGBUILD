# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

_author='R/RS/RSCHUPP'
_perlmod=PAR
pkgname=perl-par
pkgver=1.015
pkgrel=1
pkgdesc="Perl Archive Toolkit"
arch=('any')
url="http://search.cpan.org/search/PAR"
license=('GPL' 'PerlArtistic')
depends=('perl-archive-zip' 'perl-par-dist')
provides=(
perl-par-heavy
perl-par-setupprogname
perl-par-setuptemp
)
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('7d47e4b229739601f013b3043a680501cb9da48d8887d8d5d622a862a2115f46')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
build() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Makefile.PL
  make
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

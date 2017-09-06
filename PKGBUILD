# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=S/SA/SALVA
_perlmod=Devel-FastProf
pkgname=perl-devel-fastprof
pkgver=0.08
pkgrel=5
pkgdesc='Devel::FastProf - "fast" perl per-line profiler'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Devel-FastProf/'
license=('GPL' 'PerlArtistic')
depends=(
perl-sort-key
perl-time-hires
)
optdepends=()
provides=(perl-devel-fastprof-reader)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('8811020f4404b1ad12d513afa2ee134493ab254ceba585fa7d4e11047cfc5d98')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null

build(){
  cd "$srcdir"/$_perlmod-$pkgver
  perl Makefile.PL
  make
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver
  make test
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

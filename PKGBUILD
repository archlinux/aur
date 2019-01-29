# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: xduugu

_author=A/AE/AEPAGE
_perlmod=Devel-ptkdb
pkgname=perl-devel-ptkdb
pkgver=1.234
pkgrel=1
pkgdesc="Devel::ptkdb - Perl debugger using a Tk GUI"
arch=('any')
# url="http://search.cpan.org/dist/Devel-ptkdb"
url="https://sourceforge.net/projects/ptkdb/files/ptkdb/"
license=('GPL' 'PerlArtistic')
depends=(perl-tk)
makedepends=()
optdepends=()
provides=()
conflicts=()
options=(!emptydirs)
# source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
source=("https://downloads.sourceforge.net/project/ptkdb/ptkdb/$pkgver/Devel-ptkdb-$pkgver.tar.gz")
sha256sums=('d2a09ec4858d6621b4381cda29c04180f5cc6f4cd6d8b881e73dfad5e2ff801b')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null

build(){
  cd "$srcdir"/$_perlmod-$pkgver
  perl Makefile.PL
  make
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver
  perl test.pl
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

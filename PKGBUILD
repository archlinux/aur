# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-alien-base
pkgver=0.004
pkgrel=1
_author="J/JB/JBERGER"
_perlmod="Alien-Base"
pkgdesc="Alien::Base - Base classes for Alien:: modules"
arch=('any')
url="http://search.cpan.org/dist/Alien-Base/"
license=('GPL' 'PerlArtistic')
depends=(
perl-ffi-checklib
perl-test2-suite
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('1430d1e0746f18c71b00b77756df672baaf08a6ce1bb8da2609fbe539fb70439')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
build(){
  cd "$srcdir"/$_perlmod-$pkgver
  perl Build.PL
  ./Build
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver
  ./Build test
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}


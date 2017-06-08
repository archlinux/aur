# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-html-escape
pkgver=1.10
pkgrel=2
_author="T/TO/TOKUHIROM"
_perlmod="HTML-Escape"
pkgdesc="HTML::Escape - Extremely fast HTML escaping"
arch=(i686 x86_64)
url="http://search.cpan.org/dist/HTML-Escape/"
license=('GPL' 'PerlArtistic')
depends=(perl)
provides=(perl-html-escape-pureperl)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
sha256sums=('b1cbac4157ad8dedac6914e1628855e05b8dc885a4007d2e4df8177c6a9b70fb')

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

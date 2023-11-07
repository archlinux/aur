pkgname=perl-html-escape
pkgver=1.11
pkgrel=1
_author="T/TO/TOKUHIROM"
_perlmod="HTML-Escape"
pkgdesc="HTML::Escape - Extremely fast HTML escaping"
arch=(i686 x86_64)
url="https://metacpan.org/release/HTML-Escape/"
license=('GPL' 'PerlArtistic')
depends=(perl-module-build)
provides=(perl-html-escape-pureperl)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
sha256sums=('5a5eef896500d1ea6c24a9085ecfbe9a43abee68cfc66c03f889d2a2cb689a5d')

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

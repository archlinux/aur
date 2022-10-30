# Contributor: Christopher Reimer <vdr4arch[at]creimer[dot]net>

_pkgname=Text-Levenshtein-Damerau-XS
pkgname=perl-text-levenshtein-damerau-xs
pkgver=3.2
pkgrel=1
pkgdesc="XS Damerau Levenshtein edit distance"
arch=("any")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=('perl')
url="http://search.cpan.org/~ugexe/Text-Levenshtein-Damerau-XS"
source=("http://search.cpan.org/CPAN/authors/id/U/UG/UGEXE/$_pkgname-$pkgver.tar.gz")
md5sums=('677da2bb8e2e41dad0ffbd114c1e7cb4')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

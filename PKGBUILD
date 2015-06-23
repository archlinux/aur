# Maintainer: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>

_perlmod=sgml-parser-opensp
_PerlMod=SGML-Parser-OpenSP
pkgname=perl-$_perlmod
pkgver=0.994
pkgrel=2
pkgdesc="SGML::Parser::OpenSP - Parse SGML documents using OpenSP"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~bjoern/$_PerlMod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-class-accessor' 'perl-file-temp' 'perl-test-exception' 'opensp')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/B/BJ/BJOERN/$_PerlMod-$pkgver.tar.gz)
md5sums=('b1ee0244e9daa4d37f28cf32c4753691')

build() {
  cd "$srcdir/$_PerlMod-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_PerlMod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

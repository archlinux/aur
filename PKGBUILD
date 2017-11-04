# Maintainer: Flakebi <flakebi@t-online.de>
_perlmod=test-more
#_perlmod=Test-Simple
pkgname=perl-test-simple
pkgver=1.302106
pkgrel=1
pkgdesc="Test::Simple - Basic utilities for writing tests"
arch=('any')
url="https://github.com/Test-More/test-more"
#url="http://search.cpan.org/~exodist/$_perlmod/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
source=("https://github.com/Test-More/test-more/archive/v$pkgver.tar.gz")
#source=("http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/$_perlmod-$pkgver.tar.gz")
md5sums=('ccd36f49bb1f154ee6bff06374bf175d')
sha256sums=('44f44c698acaf29107c33adea564f3f4921db79aebe51a188b895f8895097214')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

}

# vim:set ts=2 sw=2 et:

# Maintainer: Flakebi <flakebi@t-online.de>
_author=exodist
_perlmod=Test-Simple
pkgname=perl-test-simple
pkgver=1.302101
pkgrel=1
pkgdesc="Test::Simple - Basic utilities for writing tests"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
source=("http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/$_perlmod-$pkgver.tar.gz")
md5sums=('846cc9ecd73fe911fee1b986d9fc8236')
sha256sums=('7da0b2ab4abd633b06a5a9a502b5a0306db6a1ae30b2777ff65873e60d3285ff')

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

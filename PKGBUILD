# Maintainer: arvids  <arvids arvids net>

_perlmod=No-Worries
pkgname=perl-no-worries
pkgver=1.2
pkgrel=1
pkgdesc="Functions to perform frequently used programming tasks"
arch=('any')
url="http://search.cpan.org/dist/No-Worries/"
license=('PerlArtistic')
depends=('perl>=5.10.0' 'perl-http-date' 'perl-params-validate' 'perl-uri')
options=('!emptydirs')
source=('http://search.cpan.org/CPAN/authors/id/L/LC/LCONS/No-Worries-1.2.tar.gz')
md5sums=('4a1d275a61f65c43eb5f47502a5e923b')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  make test

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

}

# vim:set ts=2 sw=2 et:

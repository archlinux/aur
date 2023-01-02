# Maintainer: Jimmy Xu <me at jimmyxu dot org>
# Contributor: chimeracoder <dev at chimeracoder dot net>

_perlmod='String-RewritePrefix'
_modnamespace=String
pkgname=perl-string-rewriteprefix
pkgver=0.009
pkgrel=1
pkgdesc="rewrite strings based on a set of known prefixes"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-sub-exporter')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('44918bec96a54af8ca37ca897e436709ec284a07b28516ef3cce4666869646d5')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

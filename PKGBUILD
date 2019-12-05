# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Mail-Milter-Authentication-Handler-ARC'
_modnamespace=Mail
pkgname=perl-mail-milter-authentication-handler-arc
pkgver=2.20191205
pkgrel=1
pkgdesc="Authentication Milter Module for validation of ARC signatures"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-mail-milter-authentication')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('458bbb1141fb862a9a7b544bfbee4df84a70da60a5c01cfbe207bb62934cf889')

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

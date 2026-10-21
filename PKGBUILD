# Maintainer: Jimmy Xu <me at jimmyxu dot org>
# Contributor: xRemaLx <anton dot komolov at gmail dot com>
# Contributor: Caleb Cushing <xenoterracide at gmail dot com>

_perlmod='Cache-FastMmap'
_modnamespace=Cache/ROBM
pkgname=perl-cache-fastmmap
pkgver=1.66
pkgrel=1
pkgdesc="Uses an mmap'ed file to act as a shared memory interprocess cache"
arch=("x86_64" "i686")
url="http://search.cpan.org/dist/$_perlmod"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl')
makedepends=('perl-test-deep')
options=('!emptydirs')
source=("https://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('b446c12e2ee80550c1f91bcd909b01d3568114087fd43d4b5eaaa2bc6089e245')

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
  #make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

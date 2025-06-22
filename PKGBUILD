# Maintainer: Jimmy Xu <me at jimmyxu dot org>
# Contributor: xRemaLx <anton dot komolov at gmail dot com>
# Contributor: Caleb Cushing <xenoterracide at gmail dot com>

_perlmod='Cache-FastMmap'
_modnamespace=Cache
pkgname=perl-cache-fastmmap
pkgver=1.60
pkgrel=1
pkgdesc="Uses an mmap'ed file to act as a shared memory interprocess cache"
arch=("x86_64" "i686")
url="http://search.cpan.org/dist/$_perlmod"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('9b2d3b0aef095d2c59b356a4482950d0c3a22e84e6e69b97bb96dcc1edc642ff')

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

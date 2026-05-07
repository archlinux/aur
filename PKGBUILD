# Maintainer: Jimmy Xu <me at jimmyxu dot org>
# Contributor: xRemaLx <anton dot komolov at gmail dot com>
# Contributor: Caleb Cushing <xenoterracide at gmail dot com>

_perlmod='Cache-FastMmap'
_modnamespace=Cache/ROBM
pkgname=perl-cache-fastmmap
pkgver=1.61
pkgrel=1
pkgdesc="Uses an mmap'ed file to act as a shared memory interprocess cache"
arch=("x86_64" "i686")
url="http://search.cpan.org/dist/$_perlmod"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl')
makedepends=('perl-test-deep')
options=('!emptydirs')
source=("https://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('25ef2ac8369f1b4711e90ad2ff93d6ef6b1ea1914a9de64e71ad9745b72ed27f')

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

# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Hash-SharedMem'
_modnamespace=Hash
pkgname=perl-hash-sharedmem
pkgver=0.007
pkgrel=1
pkgdesc="efficient shared mutable hash"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl')
makedepends=('perl-data-dumper' 'perl-devel-callchecker' 'perl-extutils-cbuilder' 'perl-extutils-parsexs' 'perl-module-build' 'perl-scalar-string' 'perl-test-simple')
options=('!emptydirs')
source=("http://cpan.perl.org/authors/id/K/KS/KSTAR/$_perlmod-$pkgver.tar.gz")
sha256sums=('095f03556f9f345357e9f5a2ffa0e7a1a74581ac91fc6e76f45c62b23b5e595a')

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

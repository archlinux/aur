# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Crypt-SMIME'
_modnamespace=Crypt
pkgname=perl-crypt-smime
pkgver=0.30
pkgrel=1
pkgdesc="S/MIME message signing, verification, encryption and decryption"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl')
makedepends=('perl-extutils-cchecker' 'perl-extutils-pkgconfig')
checkdepends=('perl-test-exception')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('0ca33655d3704e69611805914227814e18e3f836093ea0c1ab4c96e41b200d88')

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

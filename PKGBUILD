# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Crypt-SMIME'
_modnamespace=Crypt
pkgname=perl-crypt-smime
pkgver=0.26
pkgrel=1
pkgdesc="S/MIME message signing, verification, encryption and decryption"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl')
makedepends=('perl-extutils-cchecker' 'perl-extutils-pkgconfig')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('48a6fb20bbdfcde77789ccefe47b8f42319dfc2b63b4813d18abb74ad6c9def2')

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

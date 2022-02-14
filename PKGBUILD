# Maintainer: Giovanni Harting <539@idlegandalf.com>

_perlmod=FileHandle-Unget
_modnamespace=FileHandle
pkgname=perl-filehandle-unget
pkgver=0.1634
pkgrel=1
pkgdesc="FileHandle which supports multi-byte unget"
arch=('any')
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-scalar-list-utils')
makedepends=()
checkdepends=('perl-test-compile' 'perl-file-slurper')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
b2sums=('b7f4993e1247ac5b80828ba56137acde6660576934d42abb9628ef4afbd82b69849a95670625ce56044c12636fc81b5aab4297135b17cc4af2f4651beabaff4a')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

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

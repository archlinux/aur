# Maintainer: Giovanni Harting <539@idlegandalf.com>

_perlmod=FileHandle-Unget
_modnamespace=FileHandle
pkgname=perl-filehandle-unget
pkgver=0.1634
pkgrel=3
pkgdesc="FileHandle which supports multi-byte unget"
arch=(any)
url="http://search.cpan.org/dist/$_perlmod"
license=(GPL PerlArtistic)
depends=(perl)
checkdepends=(perl-test-compile perl-file-slurper perl-universal-require)
options=(!emptydirs)
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
b2sums=('b7f4993e1247ac5b80828ba56137acde6660576934d42abb9628ef4afbd82b69849a95670625ce56044c12636fc81b5aab4297135b17cc4af2f4651beabaff4a')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:

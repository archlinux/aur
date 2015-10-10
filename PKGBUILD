# Maintainer: Maxim Polishchuck <mpolishchuck@gmail.com>

_perlmod=Module-Reader
pkgname=perl-module-reader
pkgver=0.002003
pkgrel=1
pkgdesc='Read the source of a module like perl does'
arch=('any')
url="http://search.cpan.org/~haarg/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=()
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/$_perlmod-$pkgver.tar.gz")
md5sums=('6eec99e9c5df63a536bdc19aeeba23a2')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

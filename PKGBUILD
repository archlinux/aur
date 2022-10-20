# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-tree-rb-xs
pkgver=0.07
pkgrel=1
pkgdesc='Red/Black Tree implemented in C, with similar API to Tree::RB'
arch=('i686' 'x86_64')
url='https://metacpan.org/dist/Tree-RB-XS'
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-extutils-depends')
checkdepends=('perl-test2-suite')
source=(https://cpan.metacpan.org/authors/id/N/NE/NERDVANA/Tree-RB-XS-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=('452c60e65103105925a17f9f57a1d69d')

build() {
  cd Tree-RB-XS-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd Tree-RB-XS-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd Tree-RB-XS-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

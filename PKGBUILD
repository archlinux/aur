# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-pgplot
pkgver=2.27
pkgrel=1
pkgdesc='PGPLOT module for Perl'
arch=('i686' 'x86_64')
url='https://metacpan.org/dist/PGPLOT'
license=('PerlArtistic' 'GPL')
depends=('perl' 'pgplot')
makedepends=('perl-devel-checklib' 'perl-extutils-f77')
source=(https://cpan.metacpan.org/authors/id/E/ET/ETJ/PGPLOT-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=('d8ba6ca2c2bd9f87865f1462931223b8')

build() {
  cd PGPLOT-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd PGPLOT-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd PGPLOT-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
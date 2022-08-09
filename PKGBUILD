# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-moox-attribute-env
pkgver=0.04
pkgrel=1
pkgdesc='Allow Moo attributes to get their values from %ENV'
arch=('any')
url='https://metacpan.org/dist/MooX-Attribute-ENV'
license=('PerlArtistic' 'GPL')
depends=('perl-moo')
source=(https://cpan.metacpan.org/authors/id/E/ET/ETJ/MooX-Attribute-ENV-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=('51a2d5d3be9ff1815ff6b40e689368b5')

build() {
  cd MooX-Attribute-ENV-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd MooX-Attribute-ENV-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd MooX-Attribute-ENV-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

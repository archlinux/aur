# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-alien-gimp
pkgver=0.10
pkgrel=1
pkgdesc='Encapsulate install info for GIMP'
arch=('i686' 'x86_64')
url='https://metacpan.org/dist/Alien-Gimp'
license=('PerlArtistic' 'GPL')
depends=('perl' 'gimp')
makedepends=('perl-extutils-depends' 'perl-io-all' 'perl-extutils-pkgconfig')
source=(https://cpan.metacpan.org/authors/id/E/ET/ETJ/Alien-Gimp-$pkgver.tar.gz)
options=(!emptydirs)
md5sums=('1291e5f1642566a97486a91bee7af0bc')

build() {
  cd Alien-Gimp-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd Alien-Gimp-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd Alien-Gimp-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# $Id: PKGBUILD 254138 2017-08-26 15:30:44Z foutrelis $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=perl-anyevent-i3
pkgver=0.17
pkgrel=2
pkgdesc="Communicate with the i3 window manager"
arch=('any')
url='http://search.cpan.org/~mstplbg/AnyEvent-I3/'
license=('GPL')
depends=('perl' 'perl-anyevent' 'perl-json-xs')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/M/MS/MSTPLBG/AnyEvent-I3-${pkgver}.tar.gz)
md5sums=('907b6ed7fe6bea5914b878cdd73aba3f')

build() {
  cd AnyEvent-I3-${pkgver}
  PERL_USE_UNSAFE_INC=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd AnyEvent-I3-${pkgver}
  make test
}

package() {
  cd AnyEvent-I3-${pkgver}
  make install DESTDIR="${pkgdir}"
}

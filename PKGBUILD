# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: William J. Bowman <aur@williamjbowman.com>
# Contributor: Justin Davis <jrcd83 at gmail>
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname=perl-class-trigger
_cpanname=Class-Trigger
pkgver=0.15
pkgrel=1
pkgdesc="Mixin to add / call inheritable triggers"
arch=(any)
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-stringy')
makedepends=('perl-module-install')
url="http://search.cpan.org/dist/Class-Trigger"
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/${_cpanname}-${pkgver}.tar.gz")
md5sums=('d3ce845769127d8e750b8512e0b8ce2f')
sha256sums=('b7a878d44dea67d64df2ca18020d9d868a95596debd16f1a264874209332b07f')
sha512sums=('16e66c17cc44e3656573af7221b67c46e1cc83fdc047f6378a89ec7b8e8688f2020223018231b670c46972815e755a0b1f631f5cadd0b8f891d755c2e07526d8')

build() {

  cd ${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

test() {
  cd ${_cpanname}-${pkgver}
  make PERL_MM_USE_DEFAULT=1 test
}

package() {
  cd ${_cpanname}-${pkgver}
  make DESTDIR="${pkgdir}/" PERL_MM_USE_DEFAULT=1 install;

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

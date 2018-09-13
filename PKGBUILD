# Maintainer: Jameson Pugh <imntreal@gmail.com.

pkgname='perl-soap-wsdl'
pkgver='3.003'
pkgrel='1'
pkgdesc="SOAP with WSDL support"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-std-fast')
makedepends=('perl-module-build')
url='https://metacpan.org/pod/SOAP::WSDL'
source=("https://cpan.metacpan.org/authors/id/S/SW/SWALTERS/SOAP-WSDL-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/SOAP-WSDL-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/SOAP-WSDL-${pkgver}"
  #make test
}

package() {
  cd "${srcdir}/SOAP-WSDL-${pkgver}"
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# vim:set ts=2 sw=2 et:
sha256sums=('84f6b542d95d60211bf94cc098677c19529a897950b93461945a726d345cfcbd')

# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-image-base-x11-protocol
_lastauthor=K/KR/KRYDE
_pkgname=Image-Base-X11-Protocol
pkgver=15
pkgrel=1.1
pkgdesc="Draw into an X11::Protocol"
arch=('any')
license=('GPL')
options=('!emptydirs')
depends=('perl-x11-protocol-other' 'perl-image-base')
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('424042484b6911e730e536a0666922dca3495a4c5e3704fdded65b66163f6b5e')

build() {
  cd ${_pkgname}-${pkgver}

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check() {
  cd ${_pkgname}-${pkgver}

  make test
}
package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR="$pkgdir" install
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

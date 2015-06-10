# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-image-base
_lastauthor=K/KR/KRYDE
_pkgname=Image-Base
pkgver=1.17
pkgrel=1
pkgdesc="Base class for loading, manipulating and saving images"
arch=('any')
license=('GPL')
options=('!emptydirs')
depends=()
url="http://search.cpan.org/dist/${_pkgname}/"
source=(http://search.cpan.org/CPAN/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('f6d0d4d03026ba6a19d2ac3495171fc123522345630cadc7f43b53a667b95f81')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}

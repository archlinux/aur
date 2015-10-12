# Maintainer: graysky <graysky AT archlnux DOT us>

pkgname=perl-shell
_realname=Shell
pkgver=0.72
_pkgver=0.72_01
pkgrel=2
pkgdesc="Run shell commands transparently within perl."
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.011')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/${_realname}-${_pkgver}.tar.gz)
sha256sums=('823c044e668239be0ac96d0006f5fc9646b8a9a8adfd5f58f2dcd297e875106f')

build() {
  cd ${srcdir}/${_realname}-${_pkgver}
  perl Makefile.PL
  make
}

package() {
  cd ${srcdir}/${_realname}-${_pkgver}
  make install DESTDIR=${pkgdir}
}

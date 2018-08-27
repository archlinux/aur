# Maintainer: graysky <graysky AT archlnux DOT us>

pkgname=perl-shell
_realname=Shell
pkgver=0.73
_pkgver=0.73
pkgrel=1
pkgdesc="Run shell commands transparently within perl."
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.011')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/${_realname}-${_pkgver}.tar.gz)
sha256sums=('f7dbebf65261ed0e5abd0f57052b64d665a1a830bab4c8bbc220f235bd39caf5')

build() {
  cd ${srcdir}/${_realname}-${_pkgver}
  perl Makefile.PL
  make
}

package() {
  cd ${srcdir}/${_realname}-${_pkgver}
  make install DESTDIR=${pkgdir}
}

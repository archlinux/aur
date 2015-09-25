# Maintainer: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-DeutscheBahn
pkgname=perl-travel-status-de-deutschebahn
pkgver=2.00
pkgrel=1
pkgdesc='Interface to the DeutscheBahn online departure monitor'
url='http://finalrewind.org/projects/Travel-Status-DE-DeutscheBahn/'
license=('PerlArtistic')
arch=('any')
depends=('perl-class-accessor' 'perl-libwww' 'perl-xml-libxml')
makedepends=('perl-module-build' 'perl-file-slurp' 'perl-json' 'perl-list-moreutils'
             'perl-test-compile' 'perl-test-pod')
options=('!emptydirs')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')
source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
md5sums=('ecdbc10f6781aef9e4bd27017ed9b731' 'ce6492e4ed87fcb217ac120634d0d827')

build() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  perl Build.PL installdirs=vendor destdir="${pkgdir}"
  ./Build
}

check() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  ./Build test
}

package() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  ./Build install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}

# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

_perlmod=Travel-Status-DE-URA
pkgname=perl-travel-status-de-ura
pkgver=0.04
pkgrel=2
pkgdesc='Travel::Status::DE::URA is an inofficial interface to URA-based departure monitors (as used by ASEAG)'
url='http://finalrewind.org/projects/Travel-Status-DE-URA/'
license=('GPL' 'PerlArtistic')
arch=('any')
depends=('perl-class-accessor' 'perl-datetime' 'perl-datetime-format-duration'
          'perl-list-moreutils' 'perl-libwww' 'perl-list-allutils' 'perl-text-csv')
makedepends=('perl-file-slurp' 'perl-test-pod')
options=('!emptydirs')
source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz")
sha256sums=('42ba942fb69984d04a8488d63f7b6c2b9ffcdfc77e0191e79142965686f85d69')

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
sha256sums=('e1417a3ed6483f472ac6fc5cd79b37792ac7295b3faf41f2454e7ba13680cc32')

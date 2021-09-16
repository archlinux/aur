# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-path-iterator-rule
pkgver=1.015
pkgrel=1
pkgdesc="Iterative, recursive file finder"
arch=('any')
url="https://github.com/dagolden/Path-Iterator-Rule"
license=('Apache')
depends=('perl' 'perl-number-compare' 'perl-text-glob' 'perl-try-tiny')
checkdepends=('perl-file-pushd' 'perl-path-tiny' 'perl-test-deep' 'perl-test-filename')
source=("https://www.cpan.org/modules/by-authors/id/D/DA/DAGOLDEN/Path-Iterator-Rule-${pkgver}.tar.gz")
sha512sums=('cc310fa74855021edc86c1fcd5686684ec372062463d6f0b6e83795313ee4ee69207f20a893fbf8031991abdf40bdaa117529e92f5f3d57fb13c9700a9422481')

build() {
  cd "${srcdir}/Path-Iterator-Rule-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Path-Iterator-Rule-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Path-Iterator-Rule-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

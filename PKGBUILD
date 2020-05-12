# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-path-iterator-rule
pkgver=1.014
pkgrel=1
pkgdesc="Iterative, recursive file finder"
arch=('any')
url="https://github.com/dagolden/Path-Iterator-Rule"
license=('Apache')
depends=('perl' 'perl-number-compare' 'perl-text-glob' 'perl-try-tiny')
checkdepends=('perl-file-pushd' 'perl-path-tiny' 'perl-test-deep' 'perl-test-filename')
source=("https://www.cpan.org/modules/by-authors/id/D/DA/DAGOLDEN/Path-Iterator-Rule-${pkgver}.tar.gz")
sha512sums=('d401d3b0f59ffd15d088dc3859a118fb689d6126e5dbc7602db123ae01c461a12831768e4485732781e05d33c69c2f7be90475048633df029ba870346459c591')

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

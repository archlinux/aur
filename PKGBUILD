# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-test-command-simple
pkgver=0.05
pkgrel=1
pkgdesc="Test external commands (nearly) as easily as loaded modules"
arch=('any')
url="https://metacpan.org/release/Test-Command-Simple"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=("https://www.cpan.org/modules/by-module/Test/Test-Command-Simple-${pkgver}.tar.gz")
sha512sums=('65c921785d775a782dae9d3a3b81350374cb97bb09dd604aab71aeaed4e6818e32d8fd60c97b88d3d11ff9be8e28f0c082246e4c8981f1e36b6268464fc71c9b')

build() {
  cd "${srcdir}/Test-Command-Simple-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Test-Command-Simple-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Test-Command-Simple-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

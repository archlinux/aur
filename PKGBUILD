# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-xml-semanticdiff
pkgver=1.0007
pkgrel=1
pkgdesc="Perl extension for comparing XML documents"
arch=('any')
url="https://metacpan.org/dist/XML-SemanticDiff"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-xml-parser')
makedepends=('perl-module-build')
checkdepends=('perl-test-trailingspace')
source=("https://www.cpan.org/modules/by-module/XML/XML-SemanticDiff-${pkgver}.tar.gz")
sha512sums=('821be3c88d3df654774c282168ff7d18685ce595abd0f8358d7ddcea6f43d8f5bdd869882a74553c259e6a2ddb8bdcbc3f930497263a647711e2f3fe3c61def2')

build() {
  cd "${srcdir}/XML-SemanticDiff-${pkgver}"

  perl Build.PL create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/XML-SemanticDiff-${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/XML-SemanticDiff-${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}

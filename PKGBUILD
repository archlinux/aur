# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-pod-pom-view-restructured
pkgver=1.000003
pkgrel=1
pkgdesc="View for Pod::POM that outputs reStructuredText"
arch=('any')
url="https://metacpan.org/release/Pod-POM-View-Restructured"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-pod-pom')
source=("https://www.cpan.org/modules/by-module/Pod/Pod-POM-View-Restructured-${pkgver}.tar.gz")
sha512sums=('b3578ea86ef1c690bf652a11e2ba866c54b40e5b287d0dffeb7888de587ebc5f856826502940a23a22aeb5c9f943615d8a3f4b66048b691fea347a299b9c395b')

build() {
  cd "${srcdir}/Pod-POM-View-Restructured-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Pod-POM-View-Restructured-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Pod-POM-View-Restructured-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

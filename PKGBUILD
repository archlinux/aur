# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-pod-pom-view-restructured
pkgver=1.000002
pkgrel=1
pkgdesc="View for Pod::POM that outputs reStructuredText"
arch=('any')
url="https://metacpan.org/release/Pod-POM-View-Restructured"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-pod-pom')
source=("https://www.cpan.org/modules/by-module/Pod/Pod-POM-View-Restructured-${pkgver}.tar.gz")
sha512sums=('7174bddcf83d4456cebae6d11c030a4b11b1ff4aca05b85987717ca66d18b4f5c588df4198e3dca0c616358cf81102153cb3fdb92125c719a49f75d9321aa733')

build() {
  cd "${srcdir}/Pod-POM-View-Restructured-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Pod-POM-View-Restructured-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Pod-POM-View-Restructured-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: gilles DOT quenot AT gmail DOT com

pkgname=perl-pod-constants
pkgver=0.19
pkgrel=2
pkgdesc="Include constants from POD"
arch=('any')
license=('Artistic2.0')
depends=('perl' 'perl-pod-parser')
url="https://git.ieval.ro/?p=pod-constants.git"
source=("https://www.cpan.org/modules/by-module/Pod/Pod-Constants-${pkgver}.tar.gz")
sha512sums=('4c7b7ccdede87f0069bf100406de5b2320b5f9cb0363d413e90b419e512d4322114851d78fdd7a1bce63347ee5986ecd397b11579b91eee6e46d9b0a82b0b64a')

build() {
  cd "${srcdir}/Pod-Constants-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Pod-Constants-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Pod-Constants-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

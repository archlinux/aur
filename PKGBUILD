# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Anonymous

pkgname=perl-pod-elemental
pkgver=0.103006
pkgrel=1
pkgdesc="A system for treating a Pod documents as trees of elements"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-class-load' 'perl-mixin-linewise' 'perl-moose'
         'perl-moosex-types' 'perl-pod-eventual' 'perl-string-rewriteprefix'
         'perl-string-truncate' 'perl-sub-exporter'
         'perl-sub-exporter-formethods' 'perl-namespace-autoclean')
checkdepends=('perl-test-deep' 'perl-test-differences')
url='https://metacpan.org/release/Pod-Elemental'
source=("https://www.cpan.org/modules/by-module/Pod/Pod-Elemental-${pkgver}.tar.gz")
sha512sums=('fa8c562b8ffa28564a5f8983c2205ed7a81cc0b959217553e4021e6ad24add4557a7fb55d24891b326989938b764b9a46d321cc001a496bdfac6ca50c39c58ee')

build() {
  cd "${srcdir}/Pod-Elemental-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Pod-Elemental-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Pod-Elemental-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

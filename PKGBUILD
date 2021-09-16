# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Anonymous

pkgname=perl-pod-elemental
pkgver=0.103005
pkgrel=1
pkgdesc="A system for treating a Pod documents as trees of elements"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-class-load' 'perl-mixin-linewise' 'perl-moose' 'perl-moosex-types' 'perl-pod-eventual' 'perl-string-rewriteprefix' 'perl-string-truncate' 'perl-sub-exporter' 'perl-sub-exporter-formethods' 'perl-namespace-autoclean')
checkdepends=('perl-test-deep' 'perl-test-differences')
url='https://metacpan.org/release/Pod-Elemental'
source=("https://www.cpan.org/modules/by-module/Pod/Pod-Elemental-${pkgver}.tar.gz")
sha512sums=('bd3c6c6d5aef5b0242daddbba7c00b9cabdee4e26111562bb3efcd6032044b581ee8e66877d8ea07baff6b076cd6cccd0f55be210fbb35344a324f93d79ca667')

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

# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Anonymous

pkgname=perl-pod-weaver
pkgver=4.019
pkgrel=1
pkgdesc="A system for building Pod documents from templates"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl-config-mvp' 'perl-config-mvp-reader-ini' 'perl-datetime'
         'perl-list-moreutils' 'perl-log-dispatchouli' 'perl-mixin-linewise'
         'perl-module-runtime' 'perl-moose' 'perl-params-util'
         'perl-pod-elemental' 'perl-string-flogger' 'perl-string-formatter'
         'perl-string-rewriteprefix' 'perl-text-template'
         'perl-namespace-autoclean' )
checkdepends=('perl-ppi' 'perl-software-license' 'perl-test-differences')
url="https://metacpan.org/release/Pod-Weaver"
source=("https://www.cpan.org/modules/by-module/Pod/Pod-Weaver-${pkgver}.tar.gz")
sha512sums=('f33130f0fdb81f219c9f41b0cd1ebc962ba28937f950b6b05e0245ee45650b09e2c37721989ba8ffb90779fc5912775f066f7826ffa3eb797b9b5af084372773')

build() {
  cd "${srcdir}/Pod-Weaver-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Pod-Weaver-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Pod-Weaver-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

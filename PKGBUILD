# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Anonymous

pkgname=perl-pod-weaver
pkgver=4.018
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
sha512sums=('fd8d2665866e4fb0606111ddeddfc992077b90419bb21905514590815594b0b918a98ccbfa92fa57a646b52a0a061a02e718926edd3a7dfed52977c00bd18472')

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

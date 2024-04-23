# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Anonymous

pkgname=perl-pod-weaver
pkgver=4.020
pkgrel=1
pkgdesc="A system for building Pod documents from templates"
arch=('any')
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl-config-mvp' 'perl-config-mvp-reader-ini' 'perl-datetime'
         'perl-list-moreutils' 'perl-log-dispatchouli' 'perl-mixin-linewise'
         'perl-module-runtime' 'perl-moose' 'perl-params-util'
         'perl-pod-elemental' 'perl-string-flogger' 'perl-string-formatter'
         'perl-string-rewriteprefix' 'perl-text-template'
         'perl-namespace-autoclean' )
checkdepends=('perl-ppi' 'perl-software-license' 'perl-test-differences')
url="https://metacpan.org/release/Pod-Weaver"
source=("https://www.cpan.org/modules/by-module/Pod/Pod-Weaver-${pkgver}.tar.gz")
sha512sums=('fdea6528e67e15eddccd53e35e3e440dc54c1006dcd4408e273fcd828a4ff84dd8f8add0bd14bde798c9faf36f30bb7b2ca628e331c4f38921b3239cd61462f3')

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

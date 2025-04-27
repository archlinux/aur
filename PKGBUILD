# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: chimeracoder <dev@chimeracoder.net

pkgname=perl-moosex-types
pkgver=0.51
pkgrel=1
pkgdesc="Organise your Moose types in libraries"
arch=('any')
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl' 'perl-carp-clan' 'perl-module-runtime' 'perl-moose'
         'perl-sub-exporter' 'perl-sub-exporter-formethods' 'perl-sub-install'
         'perl-namespace-autoclean')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-fatal' 'perl-test-needs')
url="https://metacpan.org/dist/MooseX-Types"
source=("https://www.cpan.org/modules/by-module/MooseX/MooseX-Types-${pkgver}.tar.gz")
sha512sums=('0030a5b770349635605e08b93c90c4442b954b76d096c6fe845ee724a13b4d23dc68c963b5b7d7017b7e310011d87159ee27eabac1a524f8becece66ce97a464')

build() {
  cd "${srcdir}/MooseX-Types-${pkgver}"

  perl Build.PL --create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/MooseX-Types-${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/MooseX-Types-${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}

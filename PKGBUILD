# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Justin Davis <jrcd83@gmail.com>

pkgname=perl-moosex-role-parameterized
pkgver=1.11
pkgrel=2
pkgdesc="Moose roles with composition parameters"
arch=('any')
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl' 'perl-module-runtime' 'perl-moose' 'perl-namespace-autoclean'
         'perl-namespace-clean')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-cpan-meta-check' 'perl-test-fatal' 'perl-test-needs')
url="https://metacpan.org/dist/MooseX-Role-Parameterized"
source=("https://www.cpan.org/modules/by-module/MooseX/MooseX-Role-Parameterized-${pkgver}.tar.gz")
sha512sums=('7442a10f1593cecfcb01e93f314bcb6ebe95b4b9710262ef5dc7d8065ae118a96e0abbbc9f7b8986c33185a8b8aec60cf8639c0fd6eee4fb94f2e33d95eb7ed9')

build() {
  cd "${srcdir}/MooseX-Role-Parameterized-${pkgver}"

  perl Build.PL --create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/MooseX-Role-Parameterized-${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/MooseX-Role-Parameterized-${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}

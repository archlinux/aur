# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>

pkgname=perl-pod-pom
pkgver=2.01
pkgrel=1
pkgdesc="POD Object Model"
arch=('any')
url="https://metacpan.org/release/Pod-POM"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-file-slurper' 'perl-test-differences' 'perl-text-diff')
source=("https://www.cpan.org/modules/by-module/Pod/Pod-POM-${pkgver}.tar.gz")
sha512sums=('617b1c15dbaee7dfd53f7b158c08e34c38763b11fbdbe44d3a1c65bfca15b44d6d1b19b6a59360dd62a7d9e703498e76237350fb57040f39837f8190fbdbd7b0')

build() {
  cd "${srcdir}/Pod-POM-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Pod-POM-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Pod-POM-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

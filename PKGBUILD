# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Anonymous

pkgname=perl-object-id
pkgver=0.1.2
pkgrel=2
pkgdesc="A unique identifier for any object"
arch=('any')
url="https://metacpan.org/release/Object-ID"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-data-uuid' 'perl-hash-fieldhash' 'perl-sub-name')
makedepends=('perl-module-build')
checkdepends=('perl-namespace-autoclean')
source=("https://www.cpan.org/modules/by-module/Object/Object-ID-v${pkgver}.tar.gz")
sha512sums=('ac43a0c1d5b789052f4740a9dc726ef8bf197d88f1a6410ad98c7d8d5371c0419d763578f19a418bdd81c8c19f8ea43a461c6bbad31a7971d13f0452b48fb206')

build() {
  cd "${srcdir}/Object-ID-v${pkgver}"

  perl Build.PL create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/Object-ID-v${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/Object-ID-v${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}

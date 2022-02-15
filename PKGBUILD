# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-sentinel
pkgver=0.06
pkgrel=1
pkgdesc="Create lightweight SCALARs with get/set callbacks"
arch=('x86_64')
url="https://metacpan.org/dist/Sentinel"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-build')
checkdepends=('perl-test-refcount' 'perl-test-pod')
source=("https://www.cpan.org/authors/id/P/PE/PEVANS/Sentinel-${pkgver}.tar.gz")
sha512sums=('962e6af0dd4b30435e7b0c5a08d3f97a904e5ad7c674c2892489cdc7c909856b7a404c54b53e34bdbdc25abf53f9c52102803889b4244f7828f8d34a0840764b')

build() {
  cd "${srcdir}/Sentinel-${pkgver}"

  perl Build.PL create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/Sentinel-${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/Sentinel-${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}

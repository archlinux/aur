# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-file-find-object-rule
pkgver=0.0313
pkgrel=1
pkgdesc="Alternative interface to File::Find::Object"
arch=('any')
url="https://metacpan.org/release/File-Find-Object-Rule"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-class-xsaccessor' 'perl-file-find-object'
         'perl-number-compare' 'perl-text-glob')
makedepends=('perl-module-build')
checkdepends=('perl-file-treecreate')
source=("https://www.cpan.org/modules/by-module/File/File-Find-Object-Rule-${pkgver}.tar.gz")
sha512sums=('cfcd4294e053609c9c6ce50c198ad61a7abb02a8755cef47014d39fdee84ef184e9817a0a9ee90d1beb1c81110a8de51ddba729fa13aeeee223d93faaac196e8')

build() {
  cd "${srcdir}/File-Find-Object-Rule-${pkgver}"

  perl Build.PL create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/File-Find-Object-Rule-${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/File-Find-Object-Rule-${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
}

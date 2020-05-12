# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-test-filename
pkgver=0.03
pkgrel=1
pkgdesc="Portable filename comparison"
arch=('any')
url="https://github.com/dagolden/test-filename"
license=('Apache')
depends=('perl' 'perl-path-tiny')
source=("https://www.cpan.org/modules/by-module/Test/Test-Filename-${pkgver}.tar.gz")
sha512sums=('7ceb0d06937b9701e45629008946fd125fa7a97386f0cbacd8571119ba68699db3acb999d973ed4e401a32ccacbd3ba1f51de7a8c93a95dff6b64605326be235')

build() {
  cd "${srcdir}/Test-Filename-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Test-Filename-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Test-Filename-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

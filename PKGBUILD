# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-test-trailingspace
pkgver=0.0601
pkgrel=1
pkgdesc="Test for trailing space in source files"
arch=('any')
url="https://metacpan.org/release/Test-TrailingSpace"
license=('MIT')
depends=('perl' 'perl-file-find-object-rule')
makedepends=('perl-module-build')
checkdepends=('perl-file-treecreate')
source=("https://www.cpan.org/modules/by-module/Test/Test-TrailingSpace-${pkgver}.tar.gz")
sha512sums=('71a207be6d3d0791ca3f7784cda053a1de33969a531805afea3d2ce4985eb745afa5ab8cc9aa8642e236eb516dafe5962c3a433c2b53910d0b272e94efb5586b')

build() {
  cd "${srcdir}/Test-TrailingSpace-${pkgver}"

  perl Build.PL create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/Test-TrailingSpace-${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/Test-TrailingSpace-${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

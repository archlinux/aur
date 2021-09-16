# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-file-treecreate
pkgver=0.0.1
pkgrel=1
pkgdesc="Recursively create a directory tree"
arch=('any')
url="https://metacpan.org/release/File-TreeCreate"
license=('MIT')
depends=('perl')
makedepends=('perl-module-build')
source=("https://www.cpan.org/modules/by-module/File/File-TreeCreate-${pkgver}.tar.gz")
sha512sums=('736c850db328b74d4ef4ea52e01e76d8e6473243b4676c59549904dc8c7ee486601d7512b3347f67f6e6ee3a7639a38edbe74198ec3526c6b94e1f2227ce524b')

build() {
  cd "${srcdir}/File-TreeCreate-${pkgver}"

  perl Build.PL create_packlist=0
  ./Build
}

check() {
  cd "${srcdir}/File-TreeCreate-${pkgver}"

  ./Build test
}

package() {
  cd "${srcdir}/File-TreeCreate-${pkgver}"

  ./Build install --installdirs=vendor --destdir="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

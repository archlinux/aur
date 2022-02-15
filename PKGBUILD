# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-xml-tidy-tiny
pkgver=0.02
pkgrel=1
pkgdesc="Module that allows very restrictive tidy of XML"
arch=('any')
url="https://metacpan.org/dist/XML-Tidy-Tiny"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=("https://www.cpan.org/modules/by-module/XML/XML-Tidy-Tiny-${pkgver}.tar.gz")
sha512sums=('46d4b5a290f57ae8cb8e9a692b7f5e72c81ba33e65e78511de4895729d00aaf980a27b0388a3ca9f11c7e9116e5db9281ecf38235b05b71b4b4778d45f77d617')

build() {
  cd "${srcdir}/XML-Tidy-Tiny-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/XML-Tidy-Tiny-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/XML-Tidy-Tiny-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

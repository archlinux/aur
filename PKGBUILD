# Maintainer: Shingo Kawamura <perl.jq.lite@gmail.com>
pkgname=jq-lite
pkgver=1.43
pkgrel=1
pkgdesc="Lightweight jq-like JSON query engine in Perl"
arch=('any')
url="https://metacpan.org/release/JQ-Lite"
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('make' 'perl-extutils-makemaker')
source=("https://cpan.metacpan.org/authors/id/S/SH/SHINGO/JQ-Lite-${pkgver}.tar.gz")
sha256sums=('0d39722ff0432731453bdec1e4d44b17fd91905ed5a9892a1a8011666035b18c')

build() {
  cd "JQ-Lite-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "JQ-Lite-${pkgver}"
  make test
}

package() {
  cd "JQ-Lite-${pkgver}"
  make install DESTDIR="${pkgdir}" INSTALLDIRS=vendor
}

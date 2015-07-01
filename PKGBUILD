# Contributor: Archer777 <NAME at gmx dot com>

pkgname=perl-smart-comments
pkgver=1.000005
pkgrel=1
pkgdesc="Comments that do more than just sit there"
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/Smart-Comments'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/D/DC/DCONWAY/Smart-Comments-${pkgver}.tar.gz")
md5sums=('17f7fb5d43c9b8295e89344be4c40826')

build() {
  cd Smart-Comments-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Smart-Comments-${pkgver}
  make test
}

package() {
  cd Smart-Comments-${pkgver}
  make DESTDIR="$pkgdir" install
}

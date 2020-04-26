# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Eduardo Leggiero <https://www.leggiero.uk/>

pkgname=perl-ntlm
pkgver=1.09
pkgrel=3
pkgdesc='Perl/CPAN module NTLM'
arch=('any')
url='http://search.cpan.org/~nbebout/NTLM/'
license=('GPL')
makedepends=('perl-digest-hmac')
source=("http://search.cpan.org/CPAN/authors/id/N/NB/NBEBOUT/NTLM-${pkgver}.tar.gz")
b2sums=('dbf8f4497f2e57c72ad6a5dc6ff21e3cba35bdeee1ebccfc9efecb04a9808b7f3fb929c055acb7038f2990e6ef6a553a09573af70b065ffc74a72fba223e2fae')

build() {
  cd NTLM-${pkgver}
  perl Makefile.PL
  make
}

check() {
  cd NTLM-${pkgver}
  make test
}

package(){
  cd NTLM-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Jens Adam <jra@byte.cx>
# Contributor:  Guilherme M. Nogueira <guilherme@nirev.org>

_perlmod=Term-Size
pkgname=perl-term-size
pkgver=0.207
pkgrel=1
pkgdesc='provides a straightforward way to get the size of the terminal, or window, on which a script is running'
url='http://search.cpan.org/dist/Term-Size/'
license=('GPL' 'PerlArtistic')
arch=('i686' 'x86_64')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/${_perlmod}-${pkgver}.tar.gz")
md5sums=('474438fff3f12fca88a23388cc5a7571')

build() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  make test
}

package() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

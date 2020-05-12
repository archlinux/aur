# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-log-any-adapter-screen
pkgver=0.140
pkgrel=1
pkgdesc="Send logs to screen, with colors and some other features"
arch=('any')
url="https://github.com/perlancar/perl-Log-Any-Adapter-Screen"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-log-any')
source=("https://www.cpan.org/modules/by-module/Log/Log-Any-Adapter-Screen-${pkgver}.tar.gz")
sha512sums=('a7ded27bbc548108169e59964783ba6200c3afd798219bcd9daea47c390128db628c30392eb7eaebb93b5e3b59f51c717599518130b3ba31a1765cca3b4c362c')

build() {
  cd "${srcdir}/Log-Any-Adapter-Screen-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Log-Any-Adapter-Screen-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Log-Any-Adapter-Screen-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-log-any-adapter-screen
pkgver=0.141
pkgrel=1
pkgdesc="Send logs to screen, with colors and some other features"
arch=('any')
url="https://github.com/perlancar/perl-Log-Any-Adapter-Screen"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl' 'perl-log-any')
source=("https://www.cpan.org/modules/by-module/Log/Log-Any-Adapter-Screen-${pkgver}.tar.gz")
sha512sums=('825a3b71bf418c3f79723e96fb5db985182cf054fb07517bc4e1e2594efbfff37f94f3ca69e122b818feb6f8b5e6eca8fdb63b7997cf54a9ce099cce5d096471')

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

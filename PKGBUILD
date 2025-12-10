# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-getopt-long
pkgver=2.58
pkgrel=3
pkgdesc="Extended processing of command line options"
arch=('any')
url="https://metacpan.org/dist/Getopt-Long"
license=('Artistic-1.0-Perl OR GPL-2.0-or-later')
depends=('perl')
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/Getopt-Long-${pkgver}.tar.gz")
sha512sums=('c673b82a819533310d5697be7e0b009ed39fd02873d17b3f0e1eebab790c58faf5e0a6b1d79bf274e3ee9d35d43b355988dccae56ec9fcbc6822bcae7d7e2ef6')

build() {
  cd "${srcdir}/Getopt-Long-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Getopt-Long-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Getopt-Long-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}


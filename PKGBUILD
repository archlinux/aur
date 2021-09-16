# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-hash-defhash
pkgver=0.072
pkgrel=1
pkgdesc="Manipulate defhash"
arch=('any')
url="https://github.com/perlancar/perl-Hash-DefHash"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-regexp-pattern-defhash' 'perl-string-trim-more')
checkdepends=('perl-test-exception')
source=("https://www.cpan.org/modules/by-module/Hash/Hash-DefHash-${pkgver}.tar.gz")
sha512sums=('6dac91abd3d7c33e71a0cb54a41eee4d313fe57888c91825c7c2a4e6753c1ed0c0bb5d6def82534acb971a14dc641893ce0fc2a2e99c6e851b8fe1a750161c26')

build() {
  cd "${srcdir}/Hash-DefHash-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Hash-DefHash-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Hash-DefHash-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

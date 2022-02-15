# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-convert-base64
pkgver=0.001
pkgrel=1
pkgdesc="Encoding and decoding of Base64 strings"
arch=('any')
url="https://github.com/robn/Convert-Base64"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=("https://www.cpan.org/modules/by-module/Convert/Convert-Base64-${pkgver}.tar.gz")
sha512sums=('3355055631572b49b483515828147414692a68d50222322db6d84e1d46f40404ce8ec2a5283389d328415ef8703304e92d61566e61e555e88a657490e4e6e0c9')

build() {
  cd "${srcdir}/Convert-Base64-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Convert-Base64-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Convert-Base64-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

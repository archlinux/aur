# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-mail-imaptalk
pkgver=4.04
pkgrel=1
pkgdesc="IMAP client interface with lots of features"
arch=('any')
url="https://github.com/robn/mail-imaptalk"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-authen-sasl' 'perl-encode-imaputf7')
source=("https://www.cpan.org/modules/by-module/Mail/Mail-IMAPTalk-${pkgver}.tar.gz")
sha512sums=('fa60c03958b8ca361a3a9d894e67b22cc7ae40a3b452cf7f391b962dba477ce2cf027d70a00e080f421d616644db1dc90233a48bb31490afb5c5a9151d4efcdf')

build() {
  cd "${srcdir}/Mail-IMAPTalk-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Mail-IMAPTalk-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Mail-IMAPTalk-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

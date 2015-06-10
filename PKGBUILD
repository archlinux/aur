# Maintainer: James Rayner <iphitus@gmail.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=perl-unicode-string
_realname=Unicode-String
pkgver=2.09
pkgrel=7
pkgdesc="String of Unicode characters for perl (UCS2/UTF16)"
arch=('i686' 'x86_64')
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/${_realname}-${pkgver}.tar.gz)
md5sums=('553e68e603723bf7c631f8701ab0d678')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  # in stall module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}

# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: James Rayner <iphitus@gmail.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=perl-unicode-string
_realname=Unicode-String
pkgver=2.10
pkgrel=1
pkgdesc="String of Unicode characters for perl (UCS2/UTF16)"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/GAAS/${_realname}-${pkgver}.tar.gz)
md5sums=('7a8210e673824b9fb90fd1c360483890')

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

# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-config-ini
pkgver=0.028
pkgrel=1
pkgdesc="Simple .ini-file format"
arch=('any')
url="https://metacpan.org/dist/Config-INI"
license=('PerlArtistic' 'GPL')
depends=('perl-mixin-linewise')
source=("https://www.cpan.org/modules/by-module/Config/Config-INI-${pkgver}.tar.gz")
sha512sums=('9fa4692fd935f38c44f59156c50abcaa68dc6f291aca58bbf0a6b2fdf7345124e64ecc3c216126803248c50e85391f5cfee9cb14fc8fba24a2ebe0e9d8220f40')

build() {
  cd "${srcdir}/Config-INI-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Config-INI-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Config-INI-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-config-mvp-reader-ini
pkgver=2.101465
pkgrel=1
pkgdesc="An MVP config reader for .ini files"
arch=('any')
url="https://metacpan.org/dist/Config-MVP-Reader-INI"
license=('PerlArtistic' 'GPL')
depends=('perl-config-ini' 'perl-config-mvp' 'perl-moose')
source=("https://www.cpan.org/modules/by-module/Config/Config-MVP-Reader-INI-${pkgver}.tar.gz")
sha512sums=('5e8386a402e5d17ba84d953ba094b42385503c1d279c27575a2cc1cd064c05ec2f8d12d5ce0b9411793ae6201356329889c6284b1a2e8bd51a506c44d2cfa3aa')

build() {
  cd "${srcdir}/Config-MVP-Reader-INI-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Config-MVP-Reader-INI-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Config-MVP-Reader-INI-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

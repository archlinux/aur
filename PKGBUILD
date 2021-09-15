# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-class-accessor-lite
pkgver=0.08
pkgrel=2
pkgdesc="A minimalistic variant of Class::Accessor"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl')
makedepends=('perl-module-install')
url="https://metacpan.org/release/Class-Accessor-Lite"
source=("https://www.cpan.org/modules/by-module/Class/Class-Accessor-Lite-${pkgver}.tar.gz")
sha512sums=('e23afed2c0c7eb887d23c80dca1b8b0cc42d38c86f8fcceb87d384b10403e0d74d3ae3b41a9654f4fcb58462ec138f0266a0b7e94d389ecb91d271600c6e293b')

build() {
  cd "${srcdir}/Class-Accessor-Lite-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Class-Accessor-Lite-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Class-Accessor-Lite-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

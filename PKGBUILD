# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-pod-eventual
pkgver=0.094003
pkgrel=2
pkgdesc="Read a POD document as a series of trivial events"
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-mixin-linewise')
checkdepends=('perl-test-deep')
url="https://metacpan.org/release/Pod-Eventual"
source=("https://www.cpan.org/modules/by-module/Pod/Pod-Eventual-${pkgver}.tar.gz")
sha512sums=('93ccda890dc69af97c54e1502d82797c2ce0f7fcd89f431ddc8b7c983b8ade94627af8badda28284d08d6d84597d74ed30964311e76caccaf12858addda581a0')

build() {
  cd "${srcdir}/Pod-Eventual-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Pod-Eventual-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Pod-Eventual-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

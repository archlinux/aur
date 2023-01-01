# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-string-formatter
pkgver=1.235
pkgrel=1
pkgdesc="Build sprintf-like functions of your own"
arch=('any')
url="https://metacpan.org/dist/String-Formatter"
license=('PerlArtistic' 'GPL')
depends=('perl-params-util' 'perl-sub-exporter')
source=("https://www.cpan.org/modules/by-module/String/String-Formatter-${pkgver}.tar.gz")
sha512sums=('3713c281f912dd42b4c56da6727e432b531e99ffa98f4cf6efddf46bf4788e1fe6ecd3b1b95e2f6be2ff19344434849813d29214710e123c97105245bf6ba436')

build() {
  cd "${srcdir}/String-Formatter-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/String-Formatter-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/String-Formatter-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

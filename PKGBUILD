# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-config-ini
pkgver=0.029
pkgrel=1
pkgdesc="Simple .ini-file format"
arch=('any')
url="https://metacpan.org/dist/Config-INI"
license=('PerlArtistic' 'GPL')
depends=('perl-mixin-linewise')
source=("https://www.cpan.org/modules/by-module/Config/Config-INI-${pkgver}.tar.gz")
sha512sums=('9f787640ada163f8bbdda687c0fdfeb86d749a06937e379cae3732e965b248e6de96e86eba8f86c755293916a0d571c2228c1f7c7a0e15cd0aa0b642269fb5fb')

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

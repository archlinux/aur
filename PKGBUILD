# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-mixin-linewise
pkgver=0.111
pkgrel=1
pkgdesc="Write your linewise code for handles; this does the rest"
arch=('any')
url="https://metacpan.org/dist/Mixin-Linewise"
license=('PerlArtistic' 'GPL')
depends=('perl-sub-exporter' 'perl-perlio-utf8-strict')
source=("https://www.cpan.org/authors/id/R/RJ/RJBS/Mixin-Linewise-${pkgver}.tar.gz")
sha512sums=('282c9bbb825ee05f1d916fdfb1caad6c04a917a26c10ae18dc9883706e612915186c49a96209af254329f346bc731547a20ff2db136f0ceaf1edd5d21b120195')

build() {
  cd "${srcdir}/Mixin-Linewise-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Mixin-Linewise-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Mixin-Linewise-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

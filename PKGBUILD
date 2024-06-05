# Contributor: Jose Riha <jose1711 gmail com>

pkgname=perl-uuid
_cpanname=uuid
pkgver=0.35
pkgrel=1
pkgdesc="UUID - Perl extension for using UUID interfaces as defined in e2fsprogs."
arch=(x86_64)
url="https://metacpan.org/release/JRM/UUID-${pkgver}"
license=('Artistic-2.0')
options=('!emptydirs')
depends=('util-linux' 'perl')
depends=('perl-devel-checklib')
source=("https://cpan.metacpan.org/authors/id/J/JR/JRM/UUID-${pkgver}.tar.gz")
md5sums=('f71f42d3160b2b3493a4923653740d04')

build() {
  cd $srcdir/UUID-${pkgver}
  sed -i '/^auto_install/d' Makefile.PL
  perl Makefile.PL
  make
}

package() {
  cd $srcdir/UUID-${pkgver}
  make DESTDIR=$pkgdir install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

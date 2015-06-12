# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=perl-uuid
_cpanname=uuid
pkgver=0.05
pkgrel=1
pkgdesc="UUID - Perl extension for using UUID interfaces as defined in e2fsprogs."
arch=('any')
url="http://search.cpan.org/~lzap/UUID/UUID.pm"
license=('PerlArtistic')
options=('!emptydirs')
depends=('util-linux' 'perl')
source=(http://search.cpan.org/CPAN/authors/id/L/LZ/LZAP/UUID-${pkgver}.tar.gz)
md5sums=('216851ffdf56a07448daef664ca5bb6e')

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

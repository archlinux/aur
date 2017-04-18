# Maintainer: Phillip Smith <pkgbuild@phs.id.au>

pkgname=perl-iptables-rule
pkgver=0.03
pkgrel=1
pkgdesc="Perl extension for holding iptables rule information in objects"
arch=('any')
url="http://search.cpan.org/dist/IPTables-Rule/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PH/PHILLIPS/IPTables-Rule-$pkgver.tar.gz")
md5sums=('0d5bcfa3a9de84d50d909e779750dbd1')

build() {
  cd "$srcdir"/IPTables-Rule-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/IPTables-Rule-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>

pkgname=perl-iptables-rule
pkgver=0.01
pkgrel=1
pkgdesc="Perl extension for holding iptables rule information in objects"
arch=('any')
url="http://search.cpan.org/dist/IPTables-Rule/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PH/PHILLIPS/IPTables-Rule-$pkgver.tar.gz")
md5sums=('5105e0d0bd1e360a9b1351f55f1aee85')

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

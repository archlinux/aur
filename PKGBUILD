# Maintainer: robertfoster

pkgname=perl-net-ldapapi
_realname=Net-LDAPapi
pkgver=3.0.7
pkgrel=1
pkgdesc="Find matches to a pattern in a series of files and related functions"
arch=(any)
url="https://metacpan.org/release/$_realname"
license=(GPL PerlArtistic)
depends=(perl)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MI/MISHIKAL/$_realname-$pkgver.tar.gz")
sha256sums=('a38f05c0446b596ce698259fd34371da6ceb3936276c0a87167fc6f2f544c13e')

build() {
  cd $_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
}

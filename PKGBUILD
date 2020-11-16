# Maintainer: robertfoster

pkgname=perl-net-ldap
_realname=perl-ldap
pkgver=0.66
pkgrel=1
pkgdesc="Use LDAP over a UNIX domain socket"
arch=(any)
url="https://metacpan.org/release/$_realname"
license=(GPL PerlArtistic)
depends=(perl)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MARSCHAP/$_realname-$pkgver.tar.gz")
sha256sums=('09263ce6166e80c98d689d41d09995b813389fd069b784601f6dc57f8e2b4102')

build() {
  cd $_realname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
}

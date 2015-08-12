# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor: David Pflug <Viaken@Gmail.com>

_author=TLINDEN
_perlmod=note
pkgname=$_perlmod
pkgver=1.3.22
pkgrel=1
pkgdesc="A Perl-based note taking application with multiple backends"
arch=('i686' 'x86_64')
url="http://www.daemon.de/NOTE"
license=('GPL')
depends=('perl' 'perl-yaml')
optdepends=(
            'perl-config-general: general db backend'
            'perl-crypt-cbc: encryption support'
            'perl-crypt-pwsafe3: password safe 3 backend'
            'perl-crypt-rijndael: encryption support'
            'perl-dbd-mysql: mysql db backend'
            'perl-dbi: mysql db backend'
            )
source=(http://cpan.perl.org/modules/by-authors/id/T/TL/$_author/$_perlmod-$pkgver.tar.gz)
sha1sums=('ef26e44e20f96ca298acf4bcf1463a9193a6da36')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

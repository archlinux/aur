# $Id: PKGBUILD 238525 2015-05-05 23:30:47Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-file-monitor
_realname=File-Monitor
pkgver=1.00
pkgrel=0
pkgdesc="Portable implementation of file-mon"
arch=(any)
url="http://search.cpan.org/~andya/File-Monitor-1.00/lib/File/Monitor.pm"
license=(GPL PerlArtistic)
depends=(perl)
options=('!emptydirs')
_author=PLICEASE
source=("http://search.cpan.org/CPAN/authors/id/A/AN/ANDYA/File-Monitor-1.00.tar.gz")
md5sums=('29ca8fcacbd96017d1024611fae08974')

build() {
  cd "$srcdir/${_realname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/${_realname}-${pkgver}"
  make install DESTDIR="$pkgdir"
}

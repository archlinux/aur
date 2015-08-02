# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>
# Contributor: Daenyth
# Contributor: omangold

pkgname=perl-ogg-vorbis-header
pkgver=0.03
pkgrel=5
pkgdesc="Perl CPAN module Ogg::Vorbis::Header"
url="http://search.cpan.org/~dbp/Ogg-Vorbis-Header-0.03/Header.pm"
license=(GPL)
depends=(perl libvorbis)
makedepends=(perl-inline)
arch=(i686 x86_64)
options=(!emptydirs purge)

source=(http://search.cpan.org/CPAN/authors/id/D/DB/DBP/Ogg-Vorbis-Header-$pkgver.tar.gz)
sha256sums=('a683109f3625f70e01538eb27bac19d3f271a03cae999c69418f31af51dfd980')

package() {
  cd $srcdir/Ogg-Vorbis-Header-$pkgver
  perl Makefile.PL || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

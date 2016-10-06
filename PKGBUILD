# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>
# Contributor: Daenyth
# Contributor: omangold

pkgname=perl-ogg-vorbis-header
pkgver=0.05
pkgrel=1
pkgdesc="Perl CPAN module Ogg::Vorbis::Header"
url="http://search.cpan.org/~dbp/Ogg-Vorbis-Header-0.03/Header.pm"
license=(GPL)
depends=(perl perl-inline libvorbis)
makedepends=(perl-inline-c)
arch=(i686 x86_64)
options=(!emptydirs purge)

source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/Ogg-Vorbis-Header-$pkgver.tar.gz)
sha256sums=('9fefd203170c65ae3627254974554be542fd397dcfca73c5dc5d54f7fc79f761')

package() {
  cd $srcdir/Ogg-Vorbis-Header-$pkgver
  perl Makefile.PL || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: omangold
# Maintainer: Daenyth
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>

pkgname=perl-ogg-vorbis-header
pkgver=0.10
pkgrel=2
pkgdesc="An object-oriented interface to Ogg Vorbis"
url='https://metacpan.org/release/Ogg-Vorbis-Header'
license=('PerlArtistic' 'GPL')
depends=(perl perl-inline libvorbis)
makedepends=(perl-inline-c)
arch=(i686 x86_64)
options=(!emptydirs purge)

source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/Ogg-Vorbis-Header-$pkgver.tar.gz)
sha256sums=('205780fcc2d18fe9dde3204c549cb50f380bd2474edc78dd539df10fc95f125e')
_distdir=Ogg-Vorbis-Header-$pkgver

package() {
  cd $srcdir/$_distdir
  perl Makefile.PL || return 1
  make || return 1
  make test || return 1
  make DESTDIR=$pkgdir install || return 1
}

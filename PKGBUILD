# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Peter Marheine <peter@taricorp.net>
pkgname=mkg3a
pkgver=0.3
_changeset=08f34ada3fe1
pkgrel=1
pkgdesc="A tool to create Casio FX-CG addon (.g3a) files."
arch=('i686' 'x86_64')
url="http://www.taricorp.net/projects/mkg3a/"
license=('ZLIB')
depends=('libpng')
makedepends=('cmake')
source=(https://bitbucket.org/tari/$pkgname/get/$pkgver.tar.gz)
md5sums=('8a2a54bdd4205393c52be6affb890b79')

build() {
  cd "$srcdir/tari-mkg3a-$_changeset"
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/tari-mkg3a-$_changeset"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

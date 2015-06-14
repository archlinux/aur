# Maintainer: Perttu Luukko <"perttu.luukko" followed by "@iki.fi">
pkgname=git-annex-utils
pkgver=0.04
_commit="1b596a7"
pkgrel=1
pkgdesc="A set of utilities that are handy to use with git-annex repositories"
arch=('i686' 'x86_64')
url="http://git.mysteryvortex.com/?p=git-annex-utils.git;a=summary"
depends=('gmp')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::http://git.mysteryvortex.com/?p=git-annex-utils.git;a=snapshot;h=$_commit;sf=tgz")
sha1sums=("d00b253a30b895a9111d1bc8a60cdc6ba64a0e0e")

build() {
  cd "$srcdir/$pkgname-$_commit"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$_commit"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$_commit"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

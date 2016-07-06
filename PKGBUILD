# Maintainer: Michael Straube <michael_straube web de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=galois
pkgver=0.4
pkgrel=4
pkgdesc='A computer game of the "falling blocks" type, but with unique features'
arch=('i686' 'x86_64')
url="http://www.nongnu.org/galois/"
license=('GPL3')
depends=('gtkmm' 'libxml++')
source=("http://download.savannah.gnu.org/releases/galois/source/galois-$pkgver.tar.gz"
        "fix-install-path.patch")
sha1sums=('72659cc08123b4c43678e3c68f43b29ff41c3a9e'
          '588e1df837e64165c011da4afe48db83f8135d2f')

prepare() {
  patch -p0 < fix-install-path.patch
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=galois
pkgver=0.4
pkgrel=5
pkgdesc='A computer game of the "falling blocks" type, but with unique features'
arch=('i686' 'x86_64')
url="http://www.nongnu.org/galois"
license=('GPL3')
depends=('gtkmm' 'libxml++2.6')
source=("https://download.savannah.gnu.org/releases/galois/source/galois-$pkgver.tar.gz"
        "galois.patch")
sha256sums=('a168ae6514da1eda5afd761fa4eeaf510d79988d450a716a0c41ce978d99e447'
            'c4247271776f7b5df2b6bb92911c25a9ba3c30796171de5cd7dc1bd78e5a800d')

prepare() {
  # fix install path
  patch -p0 -i galois.patch
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

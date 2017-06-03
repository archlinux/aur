# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=phyml
pkgver=3.3.20170530
pkgrel=1
epoch=1
pkgdesc="Builds phylogenies from DNA or protein sequences using a maximum likelihood approach"
arch=('i686' 'x86_64')
url="http://www.atgc-montpellier.fr/phyml/"
license=('GPL2')
source=("https://github.com/stephaneguindon/phyml/archive/v$pkgver.tar.gz")
sha1sums=('f6bbeae4e5425d864e17a3dca96436ff3db050f8')

build() {
  cd "$srcdir/phyml-$pkgver"
  aclocal
  autoreconf --force --install
  automake --force --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/phyml-$pkgver"
  make DESTDIR="$pkgdir" install
}

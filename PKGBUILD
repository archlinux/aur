# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=phyml
pkgver=3.2.20160530
pkgrel=1
epoch=1
pkgdesc="Builds phylogenies from DNA or protein sequences using a maximum likelihood approach"
arch=('i686' 'x86_64')
url="http://www.atgc-montpellier.fr/phyml/"
license=('GPL2')
source=("https://github.com/stephaneguindon/phyml/archive/v$pkgver.tar.gz")
sha1sums=('24dce03e535e3b2c898d36c841d69ca8f2f89cec')

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

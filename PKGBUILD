# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=phyml
pkgver=20141029
pkgrel=1
pkgdesc="Builds phylogenies from DNA or protein sequences using a maximum likelihood approach"
arch=('i686' 'x86_64')
url="https://code.google.com/p/phyml/"
license=('GPLv2')
source=("https://github.com/stephaneguindon/phyml-downloads/releases/download/development/phyml-$pkgver.tar.gz")
sha1sums=('7ac083ae9c9da6198ef9a02ec13c7fb50d02d290')

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

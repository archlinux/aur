# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=phyml
pkgver=3.3.20200621
pkgrel=1
epoch=1
pkgdesc="Builds phylogenies from DNA or protein sequences using a maximum likelihood approach"
arch=('i686' 'x86_64')
url="https://github.com/stephaneguindon/phyml"
license=('GPL2')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('a8243923ee08c74cab609a4b086ade66c6156fc2b24450e2a500108dc644c867')

build() {
  cd "$srcdir/phyml-$pkgver"
#  aclocal
#  autoreconf --force --install
#  automake --force --add-missing
  ./autogen.sh
  ./configure --prefix=/usr --enable-phyml
  make
}

package() {
  cd "$srcdir/phyml-$pkgver"
  make DESTDIR="$pkgdir" install
}

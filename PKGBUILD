# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=phyml
pkgver=3.3.20250515
pkgrel=1
epoch=1
pkgdesc="Builds phylogenies from DNA or protein sequences using a maximum likelihood approach"
arch=('i686' 'x86_64')
url="https://github.com/stephaneguindon/phyml"
license=('GPL2')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('c8d09f52f080a95dde8d7d797da5874796a148158cd18f956110cdba13cd3368')

build() {
  cd "$srcdir/phyml-$pkgver"
  chmod +x autogen.sh
  ./autogen.sh
  ./configure --prefix=/usr --enable-phyml
  make
}

package() {
  cd "$srcdir/phyml-$pkgver"
  make DESTDIR="$pkgdir" install
}

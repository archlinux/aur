# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
pkgname=frogdata
pkgver=0.6
pkgrel=1
pkgdesc="Data for Frog. Frog is an integration of memory-based natural language processing (NLP) modules developed for Dutch."
arch=('any')
license=('GPL3')
depends=()
makedepends=()
options=(!libtool)
url="http://ilk.uvt.nl/frog"
source=("http://software.ticc.uvt.nl/$pkgname-$pkgver.tar.gz")
md5sums=('91b7e08c0715e3b5bfa57aea5a6dcda2')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

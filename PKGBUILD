# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=rnashapes
pkgver=2.1.6
pkgrel=2
pkgdesc='a runtime heuristic to speed up the computation of accumulated shape probabilities'
arch=('i686' 'x86_64')
url="http://bibiserv.techfak.uni-bielefeld.de/rnashapes/"
license=('custom')
depends=('libedit')
source=("https://bibiserv.cebitec.uni-bielefeld.de/spool/download/bibiserv_1495624364_26964/RNAshapes-$pkgver.tar.gz")
md5sums=('8f86b93771914662e54483ea0f734111')

build() {
  cd $srcdir/RNAshapes-$pkgver

  ./configure --prefix=/usr \
              --mandir=/usr/share/man

  make
}

check() {
   cd $srcdir/RNAshapes-$pkgver

   make check
}

package() {
  cd $srcdir/RNAshapes-$pkgver

  make DESTDIR=$pkgdir install

  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

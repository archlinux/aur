# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=fingerprintscan
pkgver='3.5.96'
pkgrel=1
pkgdesc='Search against FingerPRINTScan with a protein query sequence to identify the closest matching PRINTS sequence motif fingerprints in a protein sequence.'
arch=('x86_64')
license=('LGPL')
url='http://130.88.97.239/PRINTS/index.php'
depends=('gcc-libs')
makedepends=('gcc-libs')
provides=()
source=(
	fingerprintscan.tgz
)
md5sums=(
'SKIP'
)


build() {
  cd "$pkgname"

  sed 's/shuffle/ShuffleFlag/g' FingerPrint.cc > FingerPrint.cc.tmp
  mv FingerPrint.cc.tmp FingerPrint.cc
  ./configure --exec-prefix=/usr --prefix=/usr  
  make
}

package() {  
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}

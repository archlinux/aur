# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=pftools
pkgver='2.3'
pkgrel=3
pkgdesc="Contains all the software necessary to build protein and DNA generalized profiles and use them to scan and align sequences, and search databases."
arch=('x86_64')
license=('GPL')
url='https://web.expasy.org/pftools'
depends=('bash')
makedepends=('gcc-libs')
provides=('prosite')
path='/coils'
source=(
	"pftools.tar.xz"
)
sha512sums=(
'37cade666e6d7972324359a184c5e636f8ece43501a8bad500236f59d4dbf1bef592694de72eeded4ffb842f0d269b4db41cee71f167353e183b3d3c92a7efaa'
)


build() {
  cd "$pkgname"
  make all
}

package() {  
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

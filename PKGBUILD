# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-bfl
pkgver=0.8.0
pkgrel=1
pkgdesc="The Bayesian Filtering Library provides a framework for inference in Dynamic Bayesian Networks"
arch=('i686' 'x86_64')
url="http://www.orocos.org/bfl"
license=('GPL')
makedepends=('cmake' 'boost')
source=(http://people.mech.kuleuven.be/~tdelaet/bfl_tar/${pkgname}-${pkgver}-src.tar.bz2)
md5sums=('93552efb4b7e4ed60019529ce8418271')
sha256sums=('e5e14f8abbc4c38ca51f5ff97b36f66c69da3a706ee6276bcb151ada4c71195c')
sha384sums=('776b115970746a8cad664bd833321cc7cdf931c010aef6659d7dff7288fd74763e5afd4c47790ca666a23131945e4c30')
sha512sums=('045bbc415feec66206774a8bdea3843a7edf233d221bd639b1dcc01906386ff55f114a9685e1008b741ae895e6aef33641a1eab67cb106d23a085d77f1a937d5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
	
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF -DMATRIX_LIB=boost -DRNG_LIB=boost .
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
	
  make DESTDIR=${pkgdir} install
}


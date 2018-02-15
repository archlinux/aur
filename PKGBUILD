# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=libccp4-bzr
pkgver=r1861
pkgrel=2
pkgdesc="Protein X-ray crystallography toolkit - Libraries"
arch=('i686' 'x86_64')
url="http://www.ccp4.ac.uk/"
license=('GPL')
provides=('libccp4=7.0.0')
conflicts=('libccp4')
depends=('mmdb2')
makedepends=('bzr' 'gcc-fortran')
source=('libccp4-bzr::bzr+http://fg.oisin.rc-harwell.ac.uk/anonscm/bzr/libccp4/trunk')

sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s" "$(bzr revno)"
}

build() {
  cd "$srcdir/$pkgname"  
  ./configure --prefix=/usr --enable-shared --datadir=/usr/share/ccp4 --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname"  
  make DESTDIR="$pkgdir/" install
} 

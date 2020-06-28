# Maintainer: Will R (will at digi-merc dot org)
# Contributors: 

pkgname=openstopmotion
pkgver=0.6.3
pkgrel=1
pkgdesc="OpenStopMotion Animation Capture"
arch=('x86_64')
url="https://www.pfp.de/osm/"
license=('GPL')
makedepends=(qt5-base qt5-tools 'pcre' 'libtiff')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/pfedick/openstopmotion/archive/REL_${pkgver//./_}.tar.gz")
sha256sums=('e7b9f59471f438ad11163760acfcfb87871d6970f70f835e429ed4d187b7ca33')

build() {
  cd $pkgname-REL_${pkgver//./_}
  qmake OpenStopMotion.pro PREFIX=/usr
  make
}

package() {
  cd $pkgname-REL_${pkgver//./_}
  make INSTALL_ROOT="$pkgdir" install
}

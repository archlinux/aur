# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=steins-gate
pkgver=0.3.5
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
pkgdesc='Libre reimplementation of the Steins;Gate visual novel'
url='http://dev.pulsir.eu/krofna/'
depends=("libnpengine=$pkgver")
makedepends=('cmake' 'boost')
source=($pkgname-$pkgver.tar.gz::"https://github.com/FGRE/steins-gate/archive/v$pkgver.tar.gz")
sha256sums=('5078b2e8b47284da0521eca1326eb72a9afd9cd88939fe3222f73a9b510e6288')

build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}

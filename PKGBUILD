# Contributor: David Wyde <david [dot] wyde [at] gmail [dot] com>
# Maintainer: Nicolas Quiénot <niQo @ aur>

pkgname=akonadi-googledata
pkgver=1.2.0
pkgrel=1
pkgdesc="Akonadi GoogleData Plugin"
arch=('i686' 'x86_64')
url="http://pim.kde.org/akonadi/"
license=('GPL')
depends=('kdebase-runtime' 'libgcal>=0.9.6' 'kdepimlibs>=4.5.0')
makedepends=('cmake' 'automoc4' 'boost')
source=(http://libgcal.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
sha1sums=('4cf707cce882166aa00ece78a4e7152410ba54b8')

build() {
  mkdir -p build
  cd build

  cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
  make 
}

package() {
  cd build

  make DESTDIR="$pkgdir/" install
}

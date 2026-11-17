# Contributor: David Vachulka <archdvx@dxsolutions.org>

pkgname=dxirc-fox
pkgver=1.50.0
pkgrel=2
pkgdesc="A simple IRC client with FOX toolkit GUI only"
arch=('i686' 'x86_64')
url="https://dxirc.org"
license=("GPL")
depends=('fox' 'lua' 'openssl')
makedepends=('cmake' 'ninja')
conflicts=('dxirc' 'dxirc-qt')
source=(http://downloads.sourceforge.net/sourceforge/dxirc/dxirc-$pkgver.tar.gz)
md5sums=('b4ac590ad816282d86e4654515ca4b43')

build() {
  cmake -S dxirc-$pkgver -B build -G Ninja -DBUILD_QT=FALSE -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

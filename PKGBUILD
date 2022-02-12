# Contributor: dreieck
# Contributor: BlackIkeEagle

pkgname=kvirtual
pkgver=1.1.1
_commithash='c44469b'
_developer='didier13150'
pkgrel=3
pkgdesc="KDE4 GUI-frontend for kvm/qemu emulator"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KVirtual?content=150682"
license=('GPL2')
depends=('kde-cli-tools' 'kdelibs' 'qemu')
makedepends=('cmake' 'automoc4')
source=("$pkgname-$pkgver.tar.gz::https://github.com/didier13150/kvirtual/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d52b072f2cc7604493ea92c5108cb923d5e86431c1801df3877bb3d2dfd6200')


build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}
package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

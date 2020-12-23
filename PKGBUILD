# Contributor: derfenix <derfenix@gmail.com>

pkgname=neochat
pkgver=1.0
pkgrel=4
pkgdesc="A client for matrix, the decentralized communication protocol"
arch=('i686' 'x86_64')
url="https://invent.kde.org/network/neochat"
license=('GPL3')
depends=('libquotient' 'qtkeychain' 'qt5-quickcontrols2>=5.15.0' 'qt5-multimedia>=5.15.0' 'qt5-svg>=5.15.0' 'qt5-base>=5.15.0' 'kirigami2>=5.74.0' 'kitemmodels>=5.74.0' 'ki18n>=5.74.0' 'knotifications>=5.74.0' 'kconfig>=5.74.0' 'kcoreaddons>=5.74.0' 'kquickimageeditor>=0.1' 'kdbusaddons' 'cmark')
makedepends=('cmake>=3.1.0' 'extra-cmake-modules') 
source=("neochat.tar.gz::https://invent.kde.org/network/neochat/-/archive/v1.0/neochat-v1.0.tar.gz")
conflicts=('neochat')
provides=('neochat')
sha256sums=('fa999b5b427d14466d12d865f29bf051ae8ece4252586772ccf9e61ebb82fac2')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$pkgname-v$pkgver"
  make -C build
}

package() {
   make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

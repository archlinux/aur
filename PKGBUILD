# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=piscesys-screenlocker-git
_pkgname=piscesys-screenlocker
pkgver=0
pkgrel=2
pkgdesc="CutefishOS system screen locker"
arch=('x86_64')
url="https://github.com/piscesys/screenlocker"
license=('GPL')
groups=('piscesys-git')
depends=('piscesys-fishui-git' 'libpiscesys-git')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
  cd screenlocker
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd screenlocker
  make DESTDIR="$pkgdir" install
}

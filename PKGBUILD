# Maintainer: Ali Nabipour <alinabipour01@gmail.com>

pkgname=cutefish-screenlocker-git
_pkgname=cutefish-screenlocker
pkgver=0.5.r35.g3faaa49
pkgrel=1
pkgdesc="CutefishOS system screen locker"
arch=('x86_64')
url="https://github.com/cutefishos/screenlocker"
license=('GPL')
groups=('cutefish-git')
depends=('fishui-git' 'libcutefish-git')
makedepends=('extra-cmake-modules' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd screenlocker
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd screenlocker
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd screenlocker
  make DESTDIR="$pkgdir" install
}

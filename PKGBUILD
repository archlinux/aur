# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=libpisces-git
_pkgname=libpisces-git
pkgver=0
pkgrel=2
pkgdesc="System library for Cutefish applications"
arch=('x86_64')
url="https://github.com/piscesys/libpisces"
license=('GPL')
depends=('kscreen' 'modemmanager-qt' 'networkmanager-qt' 'qt5-quickcontrols2'
         # via dbus:
         'accountsservice' 'bluez' 'bluez-qt')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
  cd $_pkgname

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" ninja install
}

# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-filemanager-git
_pkgname=piscesde-filemanager
pkgver=0.9
pkgrel=1
pkgdesc="piscesDE File Manager"
arch=('x86_64')
url="https://github.com/piscesys/filemanager"
license=('GPL')
groups=('piscesde-git')
depends=('piscesde-fishui-git' 'kio' 'libpiscesde-git' 'solid')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd filemanager
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd filemanager

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd filemanager
  make DESTDIR="$pkgdir" install
}

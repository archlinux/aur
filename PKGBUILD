# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=piscesys-filemanager-git
_pkgname=piscesys-filemanager
pkgver=0.9
pkgrel=1
pkgdesc="piscesys File Manager, simple to use, beautiful, and retain the classic PC interactive design"
arch=('x86_64')
url="https://gitlab.com/piscesys/filemanager"
license=('GPL')
groups=('piscesys-git')
depends=('piscesys-fishui-git' 'kio' 'libpiscesys-git' 'solid')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "cutefish-filemanager-git")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
  cd filemanager

  cmake -DCMAKE_piscesys_PREFIX=/usr .
  make
}

package() {
  cd filemanager
  make DESTDIR="$pkgdir" install
}

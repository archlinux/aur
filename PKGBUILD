# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: Raizner Evgeniy <razrfalcon@gmail.com>

_pkgname=qmediainfo
pkgname=$_pkgname-git
pkgver=r10.589c615
pkgrel=1
pkgdesc="Simple MediaInfo parser based on Qt"
arch=('i686' 'x86_64')
url="https://github.com/RazrFalcon/QMediaInfo"
license=('GPL')
depends=('qt4' 'mediainfo')
makedepends=('git')
conflicts=($_pkgname)
provides=($_pkgname)
source=($pkgname::git://github.com/RazrFalcon/QMediaInfo.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  qmake-qt4 -config release
  make
}  

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
}


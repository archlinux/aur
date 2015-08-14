pkgname=ncxmms2-git
_gitname="ncxmms2"
pkgver=20150814
pkgrel=1
pkgdesc="An ncurses xmms2 client"
url="https://github.com/pkunavin/ncxmms2"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('xmms2' 'ncurses' 'glib2')
makedepends=('gcc>=4.6' 'make' 'cmake' 'git' 'pkgconfig')
conflicts=()
provides=()
replaces=()
source=('git+https://github.com/pkunavin/ncxmms2.git')
md5sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

build() {
  cd $_gitname
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $_gitname
  make DESTDIR=${pkgdir} install
}

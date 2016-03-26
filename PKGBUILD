
pkgname=evopedia-git
pkgver=130.633a181
pkgrel=1
pkgdesc='Offline Wikipedia Viewer'
arch=('i686' 'x86_64')
url='http://evopedia.info/'
license=('GPL3')
depends=('bzip2' 'qt4')
makedepends=('git')
conflicts=('evopedia')
source=('evopedia::git://github.com/evopedia/evopedia_qt.git')
build() {
  cd evopedia
  qmake-qt4 evopedia.pro PREFIX="$pkgdir"/usr
  make
}

package() {
  cd evopedia
  make install
}

pkgver() {
  cd evopedia
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')

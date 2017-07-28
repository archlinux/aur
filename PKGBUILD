#Mainteiner : <dikarill [at] b-tu [dot] de>
#Contributor : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=libsde-utils-git
pkgver=201707281718
pkgrel=1
url="https://sde-gui.github.io/"
pkgdesc="SDE Utility Library"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'sde-reverse-meta-git')
makedepends=('git' 'intltool' 'pkgconfig' 'cmake')
provides=('libsde-utils' )
conflicts=('libsde-utils')

source=('git+git://github.com/sde-gui/libsde-utils.git')
md5sums=('SKIP')

_gitname="libsde-utils"

pkgver() {
  date +%Y%m%d%H%M
}

build() {
    cd "${_gitname}"
    ./autogen.sh && ./configure --prefix=/usr && make
}

package () {
    cd "${_gitname}"
    make DESTDIR="$pkgdir/" install
}


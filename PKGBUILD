#Mainteiner : <dikarill [at] b-tu [dot] de>
#Contributor : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=libsde-utils-x11-git
pkgver=201707281727
pkgrel=1
url="https://sde-gui.github.io/"
pkgdesc="SDE Utility Library"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsde-utils-git' 'libx11' 'sde-reverse-meta-git')
makedepends=('git' 'intltool' 'pkgconfig' 'cmake')
provides=('libsde-utils-x11' )
conflicts=('libsde-utils-x11')

source=('git+git://github.com/sde-gui/libsde-utils-x11.git')
md5sums=('SKIP')

_gitname="libsde-utils-x11"

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


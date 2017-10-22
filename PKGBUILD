#Maintainer : <dikarill [at] b-tu [dot] de>
#Contributor : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=libsde-utils-jansson-git
pkgver=201707281722
pkgrel=1
url="https://sde-gui.github.io/"
pkgdesc="SDE Jansson Utility Library"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'sde-reverse-meta-git' 'libsde-utils-gtk2')
makedepends=('git' 'intltool' 'pkgconfig' 'cmake')
provides=('libsde-utils-jansson' )
conflicts=('libsde-utils-jansson')

source=('git+git://github.com/sde-gui/libsde-utils-jansson.git')
md5sums=('SKIP')

_gitname="libsde-utils-jansson"

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


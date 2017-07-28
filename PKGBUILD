#Maintainer : <dikarill [at] b-tu [dot] de>
#Contributor : Vadim Ushakov <igeekless [at] gmail [dot] com>

pkgname=libsde-utils-gtk2-git
pkgver=201707281722
pkgrel=1
url="https://sde-gui.github.io/"
pkgdesc="SDE Gtk+ Utility Library"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'sde-reverse-meta-git')
makedepends=('git' 'intltool' 'pkgconfig' 'cmake')
provides=('libsde-utils-gtk2' )
conflicts=('libsde-utils-gtk2')

source=('git+git://github.com/sde-gui/libsde-utils-gtk.git')
md5sums=('SKIP')

_gitname="libsde-utils-gtk"

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


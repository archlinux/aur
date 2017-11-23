# Maintainer: smlb <smlb at riseup dot net>

pkgname=libthinkpad-git
pkgver=2.3.r7.g5f9256f
pkgrel=1
pkgdesc="A general purpose userspace ThinkPad library"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/libthinkpad"
license=('BSD')
depends=('libsystemd')
makedepends=('cmake' 'git' 'pkg-config')
options=('!strip')
source=("git://github.com/libthinkpad/libthinkpad")
md5sums=('da6791c1880e73a43879023c1d7770a3')

_gitname=libthinkpad 

pkgver() {
    cd "$srcdir/$_gitname"
    git -C "${_pkgname}" describe --long | sed "s/-/.r/;s/-/./g"
}

build () {
    cd "$srcdir/$_gitname"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make 
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR=$pkgdir install
}
md5sums=('SKIP')

# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=webui-git
pkgver=r20.594a909
pkgrel=1
pkgdesc="Open source project to use web browsers as UI."
arch=('x86_64')
url="https://github.com/alifcommunity/webui/"
license=('LGPL3')
makedepends=('boost' 'cmake' 'git')
conflicts=('webui')
provides=('webui')
source=("$pkgname"::"git+https://github.com/alifcommunity/webui.git")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$pkgname
    cmake . . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
    make
}

package() {
    cd $srcdir/$pkgname
    make install
}

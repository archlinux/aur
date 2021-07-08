# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=alif-git
pkgdesc="The Alif Arabic Programming Language - لغة البرمجة العربية ألف"
pkgver=r66.a483c1b
pkgrel=0
arch=('x86_64')
url="https://www.aliflang.org/"
license=('GPL3')
depends=('boost')
optdepends=('webui: to use web browsers as UI')
conflicts=('alif')
provides=('alif')
source=("$pkgname"::"git+https://github.com/alifcommunity/compiler.git")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$pkgname
    cmake . . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/local
    make
}

package() {
    cd $srcdir/$pkgname
    make install
}

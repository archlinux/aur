# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=webui
pkgver=1.0.8
pkgrel=2
pkgdesc="Open source project to use web browsers as UI."
arch=('x86_64')
url="https://github.com/alifcommunity/webui/"
license=('LGPL3')
depends=('boost')
source=("$pkgname-$pkgver"::"git+https://github.com/alifcommunity/webui.git")
md5sums=('SKIP')

prepare() {
    cd $srcdir/$pkgname-$pkgver
    git reset 0ae148032b
}

build() {
    cd $srcdir/$pkgname-$pkgver
    git reset 0ae148032b
    cmake . . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/local
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install
}

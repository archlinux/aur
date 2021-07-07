# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=webui
pkgver=1.0.20
pkgrel=0
pkgdesc="Open source project to use web browsers as UI."
arch=('x86_64')
url="https://github.com/alifcommunity/webui/"
license=('LGPL3')
depends=('boost')
source=("$pkgname-$pkgver"::"git+https://github.com/alifcommunity/webui.git")
md5sums=('SKIP')

prepare() {
    cd $srcdir/$pkgname-$pkgver
    git reset db0a6b62de77913a9bb1e1137c557d46a1850a43
}

build() {
    cd $srcdir/$pkgname-$pkgver
    cmake . . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/local
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install
}

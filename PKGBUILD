# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thedm
pkgver=0.2
pkgrel=0
pkgdesc="Display Manager"
arch=("x86_64")
url="https://github.com/vicr123/thedm"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'qtermwidget' 'the-libs' 'qt5-svg')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/thedm.git#branch=rewrite')
md5sums=('SKIP')

build() {
        cd "$pkgname-$pkgver"
        qmake
        make
}

package() {
        cd "$pkgname-$pkgver"
        make install INSTALL_ROOT=$pkgdir
}


# Maintainer: Antonio Cervone <ant dot cervone at gmail dot com>

pkgname=freesteam
pkgver=2.1
pkgrel=1
pkgdesc="Open source steam property routines in C"
arch=('i686' 'x86_64')
url="http://freesteam.sourceforge.net/"
license=('GPL')
depends=('gsl' 'gtk2' 'python2')
makedepends=('scons')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('5993bb3aa8a121256e43363c7c2b66facc53142e0f5ed9e4f5daa492a1a3e976')

build() {
    cd ${pkgname}-${pkgver}
    scons INSTALL_PREFIX=/usr gtk
}

package() {
    cd ${pkgname}-${pkgver}
    scons INSTALL_PREFIX=/usr INSTALL_ROOT="$pkgdir" install
    install -D -m644 $srcdir/${pkgname}-${pkgver}/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


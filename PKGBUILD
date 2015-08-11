# Maintainer: Gustavo Huarcaya <diavolo@qqta.org>

pkgname=kdeplasma-applets-playbar
pkgver=0.7.1
pkgrel=1
pkgdesc="MPRIS2 client, written in QML for Plasma KDE"
arch=('any')
url="https://github.com/audoban/PlayBar"
license=('GPL')
depends=('kdelibs')
makedepends=('gcc' 'cmake' 'automoc4')
source=("https://github.com/audoban/PlayBar/archive/v0.7.1/PlayBar-${pkgver}.tar.gz")
md5sums=('b29f9fe7592f1b7044037b41519960d1')

build() {
cd $srcdir/PlayBar-${pkgver}
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make
}
package() {
cd $srcdir/PlayBar-${pkgver}/build
make DESTDIR="$pkgdir/" install
}

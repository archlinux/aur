# Maintainer: Forrest Hilton <forrestmhilton at gmail dot com>
pkgname=mandel
pkgver=5.19
pkgrel=2
pkgdesc="Wolf Jung's program and tutorials for complex dynamics researchers"
arch=('i686' 'x86_64')
url="https://www.mndynamics.com/"
# "https://github.com/ForrestHilton/mandel"
license=('GPLv3')
depends=('qt5-base')
makedepends=('git' 'make' 'qt5-base')
_ver=${pkgver//./}
source=("${url}mandel0${_ver}src.zip")
sha256sums=('SKIP')

prepare() {
 cd "$srcdir"
 unzip -o "mandel0${_ver}src.zip"
}

build() {
 cd "$srcdir"
 pwd
 qmake
 make
}

package() {
 cd "$srcdir"
 install -Dm755 mandel "$pkgdir/usr/bin/mandel"
 install -Dm644 qmnicon32.ico "$pkgdir/usr/share/pixmaps/qmnicon32.ico"
 cd ..
 install -Dm644 mandel.desktop "$pkgdir/usr/share/applications/mandel.desktop"
}

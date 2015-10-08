# Maintainer: Carlchristian Eckert <carli-eckert at gmx dot de>

pkgname=dout-git
pkgver=1.0
pkgrel=1
pkgdesc="A C++ header library for minimalistic logging"
url="http://github.com/slizzered/${pkgname%-git}"
source=("${pkgname}::git://github.com/slizzered/${pkgname%-git}.git")
license=('MIT')
arch=('i686' 'x86_64')
optdepends=('cmake: easily including dout into projects')
makedepends=('git' 'cmake>=3.0.2')
sha256sums=('SKIP')

pkgver(){
    cd ${pkgname}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd ${pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

package(){
    cd ${pkgname}
    make DESTDIR=${pkgdir} install
}

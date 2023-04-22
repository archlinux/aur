# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>
pkgname=piscesys-fishui-git
_pkgname=fishui
pkgver=0.9
pkgrel=1
pkgdesc="GUI library based on QQC2 for Piscesys applications"
arch=('x86_64')
url="https://gitlab.com/piscesys/fishui"
license=('GPL')
depends=('kwindowsystem' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2')
makedepends=('git' 'extra-cmake-modules'  'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname" "fishui-git")
source=("git+$url.git")
sha512sums=('SKIP')

build() {
    cd $_pkgname

    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd $_pkgname

    DESTDIR="$pkgdir" 
    sudo make install
}

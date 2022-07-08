# Maintainer: EndlessEden
_pkgname=wiwos20
pkgname=$_pkgname-git
pkgver=0.1.3ba16be
pkgrel=1
pkgdesc="S20 socket manager"
arch=('i686' 'x86_64')
url="https://git.stikonas.eu/andrius/s20"
license=('GPL')
depends=('qt5-base')
makedepends=('git')
source=("$_pkgname::git+https://git.stikonas.eu/andrius/s20.git")
md5sums=('SKIP')
pkgver() {
        cd "$srcdir"/"$_pkgname"
        echo "0.1.$(git rev-parse --short HEAD)"
}
build() {
        cd "$srcdir/$_pkgname"
        mkdir build
        cd build
        cmake ..
        make
}
package() {
        cd "$srcdir/$_pkgname"/build
        mkdir -p "$pkgdir/usr/bin/"
        cp s20 "$pkgdir/usr/bin/"
        cp s20-gui "$pkgdir/usr/bin/"
}

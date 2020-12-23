# Maintainer: EndlessEden
pkgname=wiwos20
pkgver=0.1
pkgrel=1
pkgdesc="S20 socket manager"
arch=('i686' 'x86_64')
url="https://git.stikonas.eu/andrius/s20"
license=('GPL')
depends=('qt5-base')
source=("$pkgname::git+https://git.stikonas.eu/andrius/s20.git")
md5sums=('SKIP')
build() {
        cd "$srcdir/$pkgname"
        mkdir build
        cd build
        cmake ..
        make
}
package() {
        cd "$srcdir/$pkgname"/build
        mkdir -p "$pkgdir/usr/bin/"
        cp s20 "$pkgdir/usr/bin/"
        cp s20-gui "$pkgdir/usr/bin/"
}

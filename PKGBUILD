# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=pawxel
pkgver=0.1.3
_tag=299d4500a4796254742d248eff4d4e864261293a
pkgrel=1
pkgdesc='Lightweight screenshot tool for designers & developers'
arch=('x86_64')
url='https://pawxel.rocks/'
license=('GPL3')
makedepends=('git')
depends=('qt5-base' 'qt5-x11extras' 'gtk3' 'libxcb' 'libx11' 'glib2')
source=("git+https://github.com/yeahitsjan/$pkgname.git#tag=$_tag")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    git submodule update --init
}

build() {
    cd "$pkgname"

    qmake
    make
}

package() {
    cd "$pkgname"
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}

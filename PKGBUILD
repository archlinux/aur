pkgname=lescienze500
pkgver=1.3.6
pkgrel=4
pkgdesc="Un software per consultare, cercare e catalogare gli articoli dei 500 numeri di Le Scienze"
arch=('i686' 'x86_64')
url="http://lescienze500.wordpress.com/"
license=('GPL')
depends=('qt4' 'sqlite')
install=lescienze500.install
source=("https://github.com/downloads/simon-r/LeScienze500/${pkgname}-${pkgver}.tar.gz")
md5sums=('1596cd3a09fd82b34751bf686f91b948')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    qmake-qt4  ./LeScienze500.pro -r -spec linux-g++ 
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make INSTALL_ROOT=${pkgdir} install
}

pkgname=iris
pkgver=0.1
pkgrel=1
pkgdesc="A simple and intuitive interface for reading in images of eyes, comparing them, and verifying their identity."
url="http://projectiris.co.uk/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdelibs')
source=(http://projectiris.co.uk/releases/source/${pkgname}-${pkgver}.tar.gz)
md5sums=(21ca4355c657f9a794217d79115e40cd)
install=('iris.install')
build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    qmake
    make || return 1
    msg "Make successful, installing..."
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/iris
    cp $srcdir/${pkgname}-${pkgver}/iris  $pkgdir/usr/bin/iris
    cp $srcdir/${pkgname}-${pkgver}/014_1_*.bmp  $pkgdir/usr/share/iris/
}

pkgname=kdeneur
pkgver=0.18.0
pkgrel=1
pkgdesc="KDE frontend for X Neural Switcher (XNeur)"
arch=('i686' 'x86_64')
url="http://xneur.ru/"
license=('GPLv3')
depends=('qt4' 'kdelibs' 'kdelibs4support' "xneur>=${pkgver}")
makedepends=('gcc' 'make')
source=("https://launchpad.net/~andrew-crew-kuznetsov/+archive/xneur-stable/+files/${pkgname}_${pkgver}+git6.orig.tar.gz")
md5sums=('2ddfa9a611d17e6ea795fa582cacdec3')
 
build() {
    cd ${srcdir}/${pkgname}-${pkgver}
 
    ./configure --prefix=/usr
    make
}
 
package() {
    cd $srcdir/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}


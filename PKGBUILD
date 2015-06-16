#Maintainer Kočmaroš Karolj <karlosmunjos at gmail dot com>

pkgname=rkrenamer
pkgver=0.4.0
pkgrel=3
pkgdesc="Application for renaming large number of files"
arch=('i686' 'x86_64')
url="http://karoljkocmaros.blogspot.com/p/rkrenamer.html"
license=('LGPL')
install=${pkgname}.install
depends=('qt5-base>=5.2')

source=(${pkgname}-${pkgver}.zip::"http://master.dl.sourceforge.net/project/rkrenamer/Source/${pkgver}/rkrenamer.zip") 

sha256sums=('f100fe7ef60f17a14d5512e40c3a1ff3a9c80df9b86637eece8d9b0e2c3c078d')
build()
{
    cd $srcdir/trunk
    qmake || return 1
    make || return 1    
}
	    
package() 
{    
    cd $srcdir/trunk
    make INSTALL_ROOT="${pkgdir}" install
}

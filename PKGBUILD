#Maintainer: Kočmaroš Karolj <karlosmunjos at gmail dot com>

pkgname=svr
pkgver=0.5.0
pkgrel=2
pkgdesc="Application for renaming videos and subtitles"
arch=('i686' 'x86_64')
url="http://karoljkocmaros.blogspot.com/p/subtitle-video-renamer.html"
license=('LGPL')
install=${pkgname}.install
depends=('qt5-base>=5.2')
source=(${pkgname}-${pkgver}.zip::'http://master.dl.sourceforge.net/project/subvidrenamer/source/${pkgver}/svr.zip')
sha256sums=('96eb3de66d152e1cbde4f539bfc8d698f0d7825d853d84075b55f1579db2b5c3')

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

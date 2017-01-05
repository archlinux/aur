#Maintainer: Kočmaroš Karolj <karlosmunjos at gmail dot com>

pkgname=svr
pkgver=0.5.1
pkgrel=1
pkgdesc="Application for renaming videos and subtitles"
arch=('i686' 'x86_64')
url="http://karoljkocmaros.blogspot.com/p/subtitle-video-renamer.html"
license=('LGPL')
install=${pkgname}.install
depends=('qt5-base>=5.2' 'zlib')
source=(${pkgname}-${pkgver}.zip::"http://master.dl.sourceforge.net/project/subvidrenamer/source/${pkgver}/svr.zip")
sha256sums=('7a2473ef7476b22d0ea25fb13061b26519f21c6462c0aad3a1201bc3e4596ff8')

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

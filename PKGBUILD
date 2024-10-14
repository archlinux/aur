# Maintainer: Sommio Lepir <me@sommio.moe>
# Contributor: Kočmaroš Karolj <karlosmunjos at gmail dot com>

pkgname=subtitle-video-renamer
pkgver=0.6.0
pkgrel=1
pkgdesc="Application for renaming videos and subtitles"
arch=('i686' 'x86_64')
url="http://karoljkocmaros.blogspot.com/p/subtitle-video-renamer.html"
license=('LGPL')
install=svr.install
depends=('qt5-base>=5.2' 'zlib')
source=(svr-${pkgver}.zip::"http://master.dl.sourceforge.net/project/subvidrenamer/source/${pkgver}/svr.zip")
sha256sums=('c6f7e3729e0f7bb0c2bba1fbf275b211fba87ea65ac8aad511cdec24885992ea')

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

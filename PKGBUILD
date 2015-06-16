#Maintainer: Kočmaroš Karolj <karlosmunjos at gmail dot com>

pkgname=ktageditor
pkgver=0.2.0
pkgrel=5
pkgdesc="KTag Editor is a free and open source Audio tag editor developed in Qt5 framework."
arch=('i686' 'x86_64')
url="http://karoljkocmaros.blogspot.com/p/ktag-editor.html"
license=('LGPL')
install=${pkgname}.install
makedepends=('taglib' 'phonon-qt5')
depends=('qt5-base>=5.1.1' 'taglib>=1.8' 'phonon-qt5')
optdepends=('phonon-qt5-vlc: audio output' 'phonon-qt5-gstreamer: audio output')
source=(${pkgname}-${pkgver}.zip::"http://master.dl.sourceforge.net/project/ktageditor/Source/${pkgver}/ktageditor.zip")
sha256sums=('20ed748eeea4bdd307b8f8004ffccfd051f11211d55ccfc32fbc1e8a6e1ae39d')

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

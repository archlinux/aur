#Maintainer: Kočmaroš Karolj <karlosmunjos at gmail dot com>

pkgname=kosqlite
pkgver=0.1.0
pkgrel=3
pkgdesc="KoSQLite is a GUI frontend for SQLite written in Qt5"
arch=('i686' 'x86_64')
url="http://karoljkocmaros.blogspot.com/p/ko.html"
license=('LGPL')
install=${pkgname}.install
depends=('qt5-base>=5.2.1')
source=(${pkgname}-${pkgver}.zip::"https://master-dl.sourceforge.net/project/kosqlite/Source/kosqlite.zip")
sha256sums=('1ed6e4f54e089f88261eccc0af95af53782ffc8d157d3dea3a02b7321cea0775')

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

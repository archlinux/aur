# By MBC (Matteo's Basic Computing)
# Maintainer : Matteo Rossillol <mbasiccomputing(at)gmail(dot)com>


_CompName=zfw-module-330r3
_GitName=ZFW-Module
pkgname=zfw-module
pkgver=3.3.0
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="It's a module for calculate a aircraft's Z.F.W." 
url="https://github.com/MBasicComputing/$_GitName"
license=('GPL3')
groups=('MBC')
depends=('qt5-base')
makedepends=('gcc' 'qt5-base')
source=("git://github.com/MBasicComputing/$_GitName#tag=v$pkgver-$pkgrel")
sha256sums=('SKIP')
            

build()
{
    cd "$srcdir/$_GitName"
    qmake
    make
}

package()
{
    install -d $pkgdir/usr/share/pixmaps
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/share/applications
    install -d $pkgdir/usr/share/zfw-module
    cd "$srcdir/$_GitName"
    install -m755 -s $_CompName $pkgdir/usr/bin/zfw-module
    install -m644 _Install/_Desktop/zfw-module.png $pkgdir/usr/share/pixmaps
    install -m644 _Install/_Desktop/zfw-module.desktop $pkgdir/usr/share/applications
    install -m644 _Install/_Share/* $pkgdir/usr/share/zfw-module
}

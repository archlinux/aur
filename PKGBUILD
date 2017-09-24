# By MBC (Matteo's Basic Computing)
# Maintainer : Matteo Rossillol <mbasiccomputing(at)gmail(dot)com>


_CompName=zfw-module-330r3
pkgname=zfw-module
pkgver=3.3.0
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="It's a module for calculate a aircraft's Z.F.W." 
url="https://github.com/CompFile/My_AUR_PKG/"
license=('GPL3')
groups=('MBC')
depends=('qt5-base')
makedepends=('gcc' 'qt5-base')
install=script.install
validpgpkeys=('CCA838293E0445BEB825D428B5A1B707E9FCFB7E')   # Mattéo Rossillol-Laruelle
source=("https://github.com/CompFile/My_AUR_PKG/raw/master/$pkgname/$pkgname-$pkgver.r$pkgrel.tar.gz"{,.sig})
sha256sums=('2e887ea6a3f97e3ad84ad77d0c06f51c751c500d90d785a5db334067933983b7'
            'SKIP')
            

build()
{
    cd "$srcdir/$pkgname-$pkgver.r$pkgrel"
    qmake
    make
}

package()
{
    install -d $pkgdir/usr/share/pixmaps
    install -d $pkgdir/usr/bin
    install -d $pkgdir/usr/share/applications
    install -d $pkgdir/usr/share/zfw-module
    cd "$srcdir/$pkgname-$pkgver.r$pkgrel"
    install -m755 -s $_CompName $pkgdir/usr/bin/zfw-module
    install -m644 _Install/_Desktop/zfw-module.png $pkgdir/usr/share/pixmaps
    install -m644 _Install/_Desktop/zfw-module.desktop $pkgdir/usr/share/applications
    install -m644 _Install/_Share/* $pkgdir/usr/share/zfw-module
}

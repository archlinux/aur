#By MBC (Matteo's Basic Computing)
#Maintainer : Matteo Rossillol <rossillolm93@gmail.com>

pkgname=zfw-module
pkgver=3.1
pkgrel=3
arch=("x86_64")
pkgdesc="It's a module for calculate a aircraft's Z.F.W.." 
url="https://github.com/CompFile/My_AUR_PKG/tree/master/Sources/$pkgname/$pkgname-$pkgver.r$pkgrel"
license=("custom")
groups=("MBC")
depends=("qt5-base>=5.9.0")
makedepends=("tar" "gcc" "qt5-base>=5.9.0")
source=("https://github.com/CompFile/My_AUR_PKG/raw/master/PKG/$pkgname/$pkgname-$pkgver.r$pkgrel.tar.gz")
md5sums=('9ee3dccd28791f5213f5df9a24ea86eb')


prepare() 
{
    cd "$srcdir"
    echo "#Decompressing $pkgname-$pkgver.r$pkgrel.tar.gz"
    tar -xzvf "$pkgname-$pkgver.r$pkgrel.tar.gz"
    echo "#Removing $pkgname-$pkgver.r$pkgrel.tar.gz"
    rm -v "$pkgname-$pkgver.r$pkgrel.tar.gz"
}

build()
{
    cd "$srcdir/$pkgname-$pkgver.r$pkgrel"
    qmake
    make
}

package()
{
    mkdir -p $pkgdir/usr/share/$pkgname/icon
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/applications
    cd "$srcdir/$pkgname-$pkgver.r$pkgrel"
    cp -v zfw-module-31r3 $pkgdir/usr/bin/ZFW
    cp -v _Install/Desktop/icon.png $pkgdir/usr/share/$pkgname/icon
    cp -v _Install/Desktop/ZFW.desktop $pkgdir/usr/share/applications
}

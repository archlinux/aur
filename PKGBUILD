# Maintainer: Samarthya Lykamanuella <lykamanuella@tutanota.de>

pkgname=freeshow-bin
pkgver=1.2.7
pkgrel=1
_debname="FreeShow-$pkgver-amd64"
pkgdesc="FreeShow is a free and open-source, user-friendly presenter software. It is a powerful church app alternative to EasyWorship and ProPresenter."
provides=(freeshow)

url="https://github.com/ChurchApps/FreeShow"
license=("GPL3")

arch=('x86_64')
source=("$_debname.deb::https://github.com/ChurchApps/FreeShow/releases/download/v$pkgver/$_debname.deb")

sha256sums=('8d7c9194ca02bd24a512100a5fc1833dfc467e4bac5976f1dea359b92bcc8fa7')

prepare(){
    cd $srcdir
    tar -xf data.tar.xz
}

package() {
    cd $srcdir
    mv usr $pkgdir/
    mv opt $pkgdir/
    mkdir $pkgdir/usr/bin
    ln -s /opt/FreeShow/freeshow $pkgdir/usr/bin/freeshow
}

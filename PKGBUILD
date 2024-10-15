# Maintainer: Samarthya Lykamanuella <lykamanuella@tutanota.de>

pkgname=freeshow-bin
pkgver=1.2.9
pkgrel=1
_debname="FreeShow-$pkgver-amd64"
pkgdesc="FreeShow is a free and open-source, user-friendly presenter software. It is a powerful church app alternative to EasyWorship and ProPresenter."
provides=(freeshow)

url="https://github.com/ChurchApps/FreeShow"
license=("GPL3")

arch=('x86_64')
source=("$_debname.deb::https://github.com/ChurchApps/FreeShow/releases/download/v$pkgver/$_debname.deb")

sha256sums=('8566c870d8c512b508b891ecf4d16ff4dbaed0109fb0f7146fc83779a7acc3da')

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

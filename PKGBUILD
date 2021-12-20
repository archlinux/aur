# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

_pkgname=lynx-nw
pkgname=${_pkgname,}
pkgver=91.0.4472.114
pkgrel=1
pkgdesc="Lynx NW.js bins - Binarios de NW para LynxOS"
url="https://gitlab.com/LynxOS/$pkgname"
license=('GPL')
arch=('any')
md5sums=('72a515d6f498ae22b4a6e63a24adef48')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/Lynx/$pkgname/
    cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/Lynx/$pkgname/
    chmod a+x $pkgdir/usr/share/Lynx/$pkgname/nw
    sudo ln -s /usr/share/Lynx/$pkgname/nw /bin/$pkgname 
}

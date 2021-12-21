# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

_pkgname=lynx-dock
pkgname=${_pkgname,}
pkgver=0.0.1
pkgrel=1
pkgdesc="Lynx Desktop Environment - Escritorio Oficial de LynxOS"
url="https://gitlab.com/LynxOS/$pkgname"
depends=(
        'lynx-nw'
        'nodejs'
        'npm'
        'gnome-menus'
        'python-dbus'
        'python-gobject'
        )
license=('GPL')
arch=('any')
md5sums=('c29fc4b3a449dd9eefae4ff8e39dbc08')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/Lynx/$pkgname/
    cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/Lynx/$pkgname/
    cd $pkgdir/usr/share/Lynx/$pkgname/ && npm i
    chmod a+x $pkgdir/usr/share/Lynx/$pkgname/$pkgname
    sudo ln -sf /usr/share/Lynx/$pkgname/$pkgname /bin/$pkgname 
}

# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

_pkgname=lynx-desktop-service
pkgname=${_pkgname,}
pkgver=0.0.1
pkgrel=1
pkgdesc="Lynx Desktop Service - Servicios de LynxOS"
url="https://gitlab.com/LynxOS/$pkgname"
depends=(
        'python'
        'lynx-dock'
        'gnome-menus'
        'python-dbus'
        'python-gobject'
        'libxkbcommon-x11'
        )
license=('GPL')
arch=('any')
md5sums=('c6e8063f87ca3c6482a861b494264445')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/Lynx/$pkgname/
    cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/Lynx/$pkgname/
    chmod a+x $pkgdir/usr/share/Lynx/$pkgname/$pkgname
    sudo ln -sf /usr/share/Lynx/$pkgname/$pkgname /bin/$pkgname 
}

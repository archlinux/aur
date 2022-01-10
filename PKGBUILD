# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

_pkgname=lynx-desktop-service
pkgname=${_pkgname,}
pkgver=0.0.2
pkgrel=1
pkgdesc="Lynx Desktop Service - Desktop Services for LynxOS"
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
md5sums=('0f72ef53f142e6fa9fd3b0b2002a47ed')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/Lynx/$pkgname/
    cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/Lynx/$pkgname/
    chmod a+x $pkgdir/usr/share/Lynx/$pkgname/$pkgname
    sudo ln -sf /usr/share/Lynx/$pkgname/$pkgname /bin/$pkgname 
}

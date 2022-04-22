# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

_pkgname=lynx-dock
pkgname=${_pkgname,}
pkgver=0.0.5
pkgrel=1
pkgdesc="Lynx Dock - Official Dock for LynxOS"
url="https://gitlab.com/LynxOS/$pkgname"
depends=(
        'nwjs-bin'
        'lynx-bootstrap'
        'lynx-menu'
        'nodejs'
        'npm'
        'gnome-menus'
        'python-dbus'
        'python-gobject'
        'python-xlib'
        )
license=('GPL')
arch=('any')
md5sums=('cb1b6fb81793c2a5fd12ae06a9ac8a97')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/Lynx/$pkgname/
    cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/Lynx/$pkgname/
    cd $pkgdir/usr/share/Lynx/$pkgname/ && npm i
    chmod a+x $pkgdir/usr/share/Lynx/$pkgname/$pkgname
    sudo ln -sf /usr/share/Lynx/$pkgname/$pkgname /bin/$pkgname 
}

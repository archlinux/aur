# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

_pkgname=lynx-menu
pkgname=${_pkgname,}
pkgver=0.0.2
pkgrel=1
pkgdesc="Lynx Menu - Oficial Menu for LynxOS"
url="https://gitlab.com/LynxOS/$pkgname"
depends=(
        'lynx-nw'
        'lynx-bootstrap'
        'nodejs'
        'npm'
        'gnome-menus'
        'python-dbus'
        'python-gobject'
        'gtk3'
        'pyside2'
        )
license=('GPL')
arch=('any')
md5sums=('a0aa1772be6717326f21547131e79402')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/Lynx/$pkgname/
    cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/Lynx/$pkgname/
    cd $pkgdir/usr/share/Lynx/$pkgname/ && npm i
    chmod a+x $pkgdir/usr/share/Lynx/$pkgname/$pkgname
    sudo ln -sf /usr/share/Lynx/$pkgname/$pkgname /bin/$pkgname 
}

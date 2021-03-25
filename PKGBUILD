# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

_pkgname=lynx-desktop
pkgname=${_pkgname,}
pkgver=0.1.0
pkgrel=1
pkgdesc="Lynx Desktop Environment - Escritorio Oficial de LynxOS"
url="https://gitlab.com/LynxOS/lde"
depends=(
        'lynx-ldk'
        'gnome-menus'
        'python-dbus'
        'python-gobject'
        'lynx-desktop-settings'
        )
license=('GPL')
arch=('any')
md5sums=('ef971739d29a5457e6fae0126453338c')
source=("$url/-/archive/$pkgver/lde-$pkgver.tar.gz")

package() {
    cd lde-$pkgver
    install -dm755 $pkgdir/usr
    cp -r $srcdir/lde-$pkgver/usr/* $pkgdir/usr
    install -dm755 $pkgdir/usr/share/Lynx/lde/
    cp -r $srcdir/lde-$pkgver/src/* $pkgdir/usr/share/Lynx/lde/
    chmod a+x $pkgdir/usr/share/Lynx/lde/lynx-desktop
    chmod a+x $pkgdir/usr/share/Lynx/lde/exit-menu
}

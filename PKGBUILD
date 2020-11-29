# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=lynx-desktop-settings
pkgver=0.0.1
pkgrel=2
pkgdesc="Archivos de configuracion de LynxOS"
arch=('any')
url="https://gitlab.com/LynxOS/lds"
license=('GPL')
makedepends=('git')
source=("$url/-/archive/$pkgver/lds-$pkgver.tar.gz")
md5sums=('7bf884d646b6be11a9ed0d8c1bc0e00d')
depends=(
        'dex'
        'qt5-styleplugins'
        'dunst'
        'xcursor-breeze'
        'qt5ct'
        'polkit-gnome'
        'lynx-menu-data'
        'network-manager-applet'
        'mutter'
        'tint2'
        'pavucontrol'
        'pa-applet-git'
        )

package() {
    cd $_pkgbase
    install -dm755 $pkgdir/etc
    install -dm755 $pkgdir/usr/share/glib-2.0/schemas
    cp -r $srcdir/lds-$pkgver/etc/skel $pkgdir/etc
    cp -r $srcdir/lds-$pkgver/usr $pkgdir/
    chmod a+x $pkgdir/usr/bin/lynx-session
    cp $srcdir/lds-$pkgver/schemas/* $pkgdir/usr/share/glib-2.0/schemas
}

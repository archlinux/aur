# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=lynx-desktop-settings
pkgver=0.0.3
pkgrel=2
pkgdesc="Archivos de configuracion de LynxOS"
arch=('any')
url="https://gitlab.com/LynxOS/lds"
license=('GPL')
makedepends=('git')
source=("$url/-/archive/$pkgver/lds-$pkgver.tar.gz")
md5sums=('d7ddc712c12fe0f8f61af97534d8ef22')
depends=(
        'dex'
        'qt5-styleplugins'
        'dunst'
        'xcursor-breeze'
        'qt5ct'
        'polkit-gnome'
        'sxhkd-git'
        'lynx-menu-data'
        'lynx-gtk-theme'
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

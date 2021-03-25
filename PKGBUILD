# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=lynx-desktop-settings
pkgver=0.0.4
pkgrel=2
pkgdesc="Archivos de configuracion de LynxOS"
arch=('any')
url="https://gitlab.com/LynxOS/lds"
license=('GPL')
makedepends=('git')
source=("$url/-/archive/$pkgver/lds-$pkgver.tar.gz")
md5sums=('cc3d383ac22c116202a1a1e85e632c5')
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
        'gala'
        'tint2'
        'pavucontrol'
        'pa-applet-git'
        )

package() {
    cd $_pkgbase
    install -dm755 $pkgdir/etc
    install -dm755 $pkgdir/usr/share/glib-2.0/schemas
    install -dm755 $pkgdir/etc/lynx
    install -d ${pkgdir}/etc/dconf
    cp -vr $srcdir/lds-$pkgver/etc/dconf/* $pkgdir/etc/dconf
    cp $srcdir/lds-$pkgver/etc/lynx/session.yaml $pkgdir/etc/lynx/session.yaml
    cp -r $srcdir/lds-$pkgver/etc/skel $pkgdir/etc
    cp -r $srcdir/lds-$pkgver/usr $pkgdir/
    chmod a+x $pkgdir/usr/bin/lynx-session
    cp $srcdir/lds-$pkgver/schemas/* $pkgdir/usr/share/glib-2.0/schemas
}

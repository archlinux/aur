# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=lynx-desktop-settings
pkgver=0.0.1
pkgrel=2
arch=('any')
url="https://gitlab.com/LynxOS/lds"
license=('GPL')
makedepends=('git')
source=("$url/-/archive/$pkgver/lds-$pkgver.tar.gz")
md5sums=('SKIP')
depends=(
        'dex'
        'qt5-styleplugins'
        'dunst'
        'papirus-maia-icon-theme'
        'xcursor-breeze'
        'qt5ct'
        'matcha-gtk-theme'
        'kvantum-theme-matchama'
        'kvantum-manjaro'
        'polkit-gnome'
        'lynx-menu-data'
        'network-manager-applet'
        'gala'
        'mutter'
        'tint2'
        'pavucontrol-qt'
        'pa-applet'
        )

pkgver() {
    date +%Y%m%d
}

package() {
    cd $_pkgbase
    install -dm755 $pkgdir/etc
    install -dm755 $pkgdir/usr/share/glib-2.0/schemas
    cp -r etc/skel $pkgdir/etc
    cp -r usr $pkgdir/
    chmod a+x $pkgdir/usr/bin/lynx-session
    cp schemas/* $pkgdir/usr/share/glib-2.0/schemas
}

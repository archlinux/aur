# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

pkgname=lynx-menu-data
pkgver=0.0.1
pkgrel=1
pkgdesc="freedesktop.org application menu definition files for LynxOS"
arch=('any')
url="https://gitlab.com/LynxOS/lmd"
license=('GPL')
makedepends=('git')
source=("$url/-/archive/$pkgver/lmd-$pkgver.tar.gz")
md5sums=('528329c7481fccf2bb62513fd05cc52c')

pkgver() {
    date +%Y%m%d
}

package() {
    cd "$pkgname"
    mkdir -p "${pkgdir}/etc/xdg/menus" "${pkgdir}/usr/share/desktop-directories"
    cp $srcdir/lynx-xdg-menu/lynx-applications.menu $pkgdir/etc/xdg/menus
    cp -r $srcdir/lynx-desktop-directories/* $pkgdir/usr/share/desktop-directories
}

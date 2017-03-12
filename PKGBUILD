# Maintainer: Yamakaky <yamakaky@yamaworld_fr>
pkgname=safeeyes
pkgver=1.1.8
pkgrel=1
pkgdesc="A Linux alternative for EyeLeo"
arch=("any")
url="https://github.com/slgobinath/SafeEyes"
license=("GPL3")
depends=("hicolor-icon-theme"
         "libappindicator-gtk3"
         "mpg123"
         "python2-babel"
         "python2-dbus"
         "python2-gobject"
         "python2-xlib"
         "xorg-xprop"
         "xprintidle")
source=(safeeyes-$pkgver.tar.gz::"https://github.com/slgobinath/SafeEyes/releases/download/v$pkgver/safeeyes.tar.gz")
sha1sums=('d20ae9fad67221f8d2aa8df184be0b23d815793a')

package() {
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -r usr "$pkgdir/"
    sed -i -re "s/^Exec=.*$/Exec=safeeyes/" \
             "$pkgdir/usr/share/applications/safeeyes.desktop"
    cp -r opt/safeeyes "$pkgdir/usr/lib/"
    ln -s /usr/lib/safeeyes/safeeyes "$pkgdir/usr/bin/"
}

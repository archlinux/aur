# Maintainer: Yamakaky <yamakaky@yamaworld_fr>
pkgname=safeeyes
pkgver=1.1.2
pkgrel=1
pkgdesc="A Linux alternative for EyeLeo"
arch=("any")
url="https://github.com/slgobinath/SafeEyes"
license=("GPL3")
depends=("python2-xlib"
         "python2-gobject"
         "python2-dbus"
         "hicolor-icon-theme"
         "xorg-xprop"
         "libappindicator-gtk3")
source=(safeeyes-$pkgver.tar.gz::"https://github.com/slgobinath/SafeEyes/releases/download/v$pkgver/safeeyes.tar.gz")
sha1sums=('d7b15ebafb20d09dda3b6d47763c31f7c4f82e58')

package() {
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -r usr "$pkgdir/"
    sed -ire "s/^Exec=.*$/Exec=safeeyes/" \
             "$pkgdir/usr/share/applications/safeeyes.desktop"
    cp -r opt/safeeyes "$pkgdir/usr/lib/"
    ln -s /usr/lib/safeeyes/safeeyes "$pkgdir/usr/bin/"
}

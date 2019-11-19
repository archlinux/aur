# Maintainer: Abigail G <me@kb6.ee>

pkgname=gridtracker-bin
pkgver='1.19.1119'
pkgrel=1
pkgdesc="Companion program for WSJT-X for mapping contacts"
arch=('x86_64')
url="https://tagloomis.com/grid-tracker/"
license=('closed')
depends=(libxss nss gtk3)
source=("http://tagloomis.com/arch/GridTracker-Linux-64-$pkgver.tar.gz"
        "gridtracker.png"
        "GridTracker.desktop")
md5sums=('fa7849d8d62b913068cec28268525a59'
         '3fa9c03006acb6b2771e9e173f617bac'
         '5823ba6c9b92cb80c73b4fbc281af1f8')

package() {
    # Install into /opt/GridTracker
    mkdir -p $pkgdir/opt
    cp -r GridTracker $pkgdir/opt
    cp gridtracker.png $pkgdir/opt/GridTracker

    # Symlink executable to /usr/bin
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/GridTracker/GridTracker $pkgdir/usr/bin/GridTracker

    mkdir -p $pkgdir/usr/share/applications
    cp GridTracker.desktop $pkgdir/usr/share/applications/GridTracker.desktop
}

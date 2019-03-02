# Maintainer: Galen Gold <galen@galengold.me>

pkgname=gridtracker-bin
pkgver='1.19.0227'
pkgrel=2
pkgdesc="Companion program for WSJT-X for mapping contacts"
arch=('x86_64')
url="https://tagloomis.com/grid-tracker/"
license=('unknown')
depends=(libxss nss gtk3)
source=("https://www.dropbox.com/s/uqb5wbg1sp4f8sl/GridTracker-Linux-64-1.19.0227.tar.gz"
        "gridtracker.png"
        "GridTracker.desktop")
md5sums=('cb7caf7864dafcc4ec9436c9098060b9'
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

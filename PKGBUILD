# Maintainer: Galen Gold <galen@galengold.me>

pkgname=gridtracker-bin
pkgver='1.18.0522'
pkgrel=1
pkgdesc="Companion program for WSJT-X for mapping contacts"
arch=('x86_64')
url="https://tagloomis.com/grid-tracker/"
license=('unknown')
depends=(libxss nss gtk3)
source=("gridtracker-linux-64-$pkgver.tar.gz::https://tagloomis.com/download/gridtracker-linux-64-tar-gz-${pkgver//./-}/?wpdmdl=738"
        "gridtracker.png"
        "GridTracker.desktop")
md5sums=('d3b8f9f86abfbb0176b5608a7a712e7f'
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

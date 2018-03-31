# Maintainer: lwsk <lwsk@protonmail.com>
pkgname=openleecher
pkgver=1.0
pkgrel=1
pkgdesc="Random internet browsing tool."
arch=('any')
url='https://openleecher.tk/'
license=('MIT')
depends=('python')
depends+=('pyqt5-common')
depends+=('python-pip')
makedepends=()
backup=()
options=('!emptydirs')
source=()
md5sums=()

package() {
    sudo pip install pyinstaller
    sudo pip install psutil
    sudo pip install PyQt5
    pyinstaller -F ../openleecher.py

    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/etc/openleecher/
    mkdir -p $pkgdir/usr/share/applications/
    mkdir -p $pkgdir/usr/share/icons/

    cp dist/openleecher $pkgdir/usr/bin/
    chmod +x $pkgdir/usr/bin/openleecher

    cp ../config.ini $pkgdir/etc/openleecher/
    chmod 776 $pkgdir/etc/openleecher/config.ini

    cp ../openleecher.png $pkgdir/usr/share/icons/
    cp ../openleecher.desktop $pkgdir/usr/share/applications/

    cp ../LICENSE $pkgdir/etc/openleecher/
    cp ../x.png $pkgdir/etc/openleecher/
    cp ../pause.png $pkgdir/etc/openleecher/
    cp ../slider.gif $pkgdir/etc/openleecher/

    touch $pkgdir/etc/openleecher/openleecher.log
    chmod 776 $pkgdir/etc/openleecher/openleecher.log
}

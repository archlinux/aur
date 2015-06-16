# Maintainer: esclapion <esclapion[at]gmail[dot]com>

pkgname=redshiftconf
pkgver=2.1
pkgrel=1
pkgdesc="redshift configuration tool (Qt5)"
url=https://forum.manjaro.org/index.php?topic=22999.0
arch=(x86_64 i686)
license=(GPL)
depends=(redshift qt5-base)
makedepends=(qt5-tools)
source=(http://esclapion.free.fr/AUR/redshiftconf-$pkgver.tar.gz)
md5sums=('a6ea5aa7d717706d6b36ea7496fc4173')

package() {
    cd $srcdir
    qmake-qt5
    make
    mkdir -p $pkgdir/usr/bin
    install -s -m 755 redshiftconf $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/applications
    install -m 644 redshiftconf.desktop $pkgdir/usr/share/applications
}

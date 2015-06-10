# Maintainer: languiar <languitar at semipol dot de>
pkgname=spread-java
pkgver=4.4.0
pkgrel=2
pkgdesc="Spread is an open source toolkit that provides a high performance messaging service - Java Bindings"
url="http://www.spread.org"
license=('custom')
depends=('java-environment')
optdepends=('spread-daemon: daemon to connect to')
makedepends=('apache-ant')
arch='any'
source=("http://www.spread.org/download/spread-src-$pkgver.tar.gz?FILE=spread-src-$pkgver.tar.gz&name=aur&company=archlinux&email=foo@example.org")
md5sums=('969d315ce857982192bd48441353d944')

build() {

    cd $srcdir/spread-src-$pkgver

    cd $srcdir/spread-src-$pkgver/java || return 1
    ant jar || return 1

}

package() {
    cd $srcdir/spread-src-$pkgver/java || return 1
    install -D -m644 dest/spread-$pkgver.jar $pkgdir/usr/share/java/spread/spread.jar || return 1

    install -D $srcdir/spread-src-$pkgver/license.txt $pkgdir/usr/share/licenses/spread-java/LICENSE || return 1
}

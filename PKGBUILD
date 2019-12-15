# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=freehep-io
pkgname=java-$_pkgname
pkgver=2.2.2
pkgrel=1
pkgdesc="Extensions for java.io"
arch=("any")
url="http://freehep.github.io/freehep-io"
license=('LGPL2.1')
depends=('jdk8-openjdk' 'java-runtime')
makedepends=('maven')
source=("https://github.com/freehep/$_pkgname/archive/$_pkgname-$pkgver.tar.gz")
sha256sums=('dd66232e8c484d35a732f05e04834d520a04769f4bc86c6eeaee764bf96f511b')

build() {
    cd $srcdir/$_pkgname-$_pkgname-$pkgver
    mvn -DskipTests=true clean package
}

check() {
    cd $srcdir/$_pkgname-$_pkgname-$pkgver
    mvn test
}

package() {
    cd $srcdir/$_pkgname-$_pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/java/$_pkgname
    install -m755 target/$_pkgname-$pkgver.jar $pkgdir/usr/share/java/$_pkgname
}

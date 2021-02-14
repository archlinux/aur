# Maintainer: Felix Fung <fylixeoi@gmail.com>

pkgname=apache-zeppelin
pkgver=0.9.0
pkgrel=1
pkgdesc="Data analytics and visualization notebook with backends of Spark, Hadoop, SQL and more"
arch=('x86_64')
url="http://zeppelin.apache.org/"
license=('Apache')
depends=('java-environment')
makedepends=()
install=${pkgname}.install
source=("http://apache.claz.org/zeppelin/zeppelin-$pkgver/zeppelin-$pkgver-bin-all.tgz"
    "apache-zeppelin.service")
sha512sums=(SKIP SKIP)

PKGEXT='.pkg.tar' # no need for package compression, which takes too much time

package() {
    mkdir -p "$pkgdir/opt"
    cp -r "$srcdir/zeppelin-$pkgver-bin-all" "$pkgdir/opt/apache-zeppelin"
    install -Dm644 "$srcdir/apache-zeppelin.service" "$pkgdir/usr/lib/systemd/system/apache-zeppelin.service"
}

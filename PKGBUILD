# Maintainer: Felix Fung <fylixeoi@gmail.com>

pkgname=apache-zeppelin
pkgver=0.8.2
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
sha512sums=(91a785153bc47b087f90fac0f83066fdede041d5193506b231af1b6855b150307873c92cea462c6dd48ef6d38caa37934591a08542199ac4b02d9493298fbd43 SKIP)

PKGEXT='.pkg.tar' # no need for package compression, which takes too much time

package() {
    mkdir -p "$pkgdir/opt"
    cp -r "$srcdir/zeppelin-$pkgver-bin-all" "$pkgdir/opt/apache-zeppelin"
    install -Dm644 "$srcdir/apache-zeppelin.service" "$pkgdir/usr/lib/systemd/system/apache-zeppelin.service"
}

# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Felix Fung <fylixeoi@gmail.com>
pkgname=apache-zeppelin
pkgver=0.12.0
pkgrel=1
pkgdesc="Data analytics and visualization notebook with backends of Spark, Hadoop, SQL and more"
arch=('x86_64')
url="https://zeppelin.apache.org/"
license=('Apache')
depends=('java-environment')
makedepends=()
install=${pkgname}.install
source=("https://dlcdn.apache.org/zeppelin/zeppelin-$pkgver/zeppelin-$pkgver-bin-all.tgz"
    "apache-zeppelin.service")
sha512sums=('91b1eb4ff90b3345d6fab909c60c9ed51d0ace131608c942dc3a3e0d4fb3fd868b17325f4e6e2a2a23e3a75e46a60e96256f979b375a6b1f023fd12d4fd87609'
            'f747f58a84801058d7bdfa955660f79d28811122c709a07ea53ce11438105d7d4214cf714f0c5a624d9ff2fbd16d77d3ae1ff27058a891f550a76242bf18ada6')

PKGEXT='.pkg.tar' # no need for package compression, which takes too much time

package() {
    mkdir -p "$pkgdir/opt"
    cp -r "$srcdir/zeppelin-$pkgver-bin-all" "$pkgdir/opt/apache-zeppelin"
    install -Dm644 "$srcdir/apache-zeppelin.service" "$pkgdir/usr/lib/systemd/system/apache-zeppelin.service"
}

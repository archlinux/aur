# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname="kyotocabinet-java"
pkgver="1.24"
pkgrel=1
pkgdesc="Library of routines for managing a database"
url="https://dbmx.net/kyotocabinet"
depends=("jre")
makedepends=("jdk15-openjdk" "autoconf")
license=("GPLv3")
arch=("x86_64")
source=("http://fallabs.com/kyotocabinet/javapkg/$pkgname-$pkgver.tar.gz")
sha256sums=("9c0ddd561dc34e6b45cb37bef69e0d4536cc42040646247f28635b898e477fb0")

build() {
    export JAVA_HOME=/usr/lib/jvm/java-15-openjdk
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure
    make
}

package() {
    export JAVA_HOME=/usr/lib/jvm/java-15-openjdk
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}

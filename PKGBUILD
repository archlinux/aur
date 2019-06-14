# Maintainer: CarsonGraham <carson42g at gmail dot com>
pkgname=gumboscript
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A simple programing language"
arch=('any')
url="gumbocoin.com/gumboscript"
license=()
groups=()
depends=(java-runtime-common)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz::https://github.com/mee42/GumboScript/archive/v$pkgver.tar.gz)
noextract=()

prepare() {
	tar xzf $pkgname-$pkgver.tar.gz
}

build() {
    pwd
    ls
    cd "GumboScript-$pkgver"
    pwd
    ls
	./gradlew shadowJar
}

package() {
	cd "GumboScript-$pkgver"
	echo "pkgdir:$pkgdir"

    mkdir "$pkgdir/usr"
	mkdir "$pkgdir/usr/bin"
	install "./bin/gumboscript" "$pkgdir/usr/bin/gumboscript"

    mkdir "$pkgdir/opt"
	mkdir "$pkgdir/opt/gumboscript"
	install "./build/libs/gumboscript-all.jar" "$pkgdir/opt/gumboscript/gumboscript.jar"
}
md5sums=('af7c2a6a9e00a4cd2ad52cc66ac1e1f1')

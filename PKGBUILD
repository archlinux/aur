# Maintainer: CarsonGraham <carson42g at gmail dot com>
pkgname=gumboscript
pkgver=0.0.5
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
md5sums=('3ecaaae9f877c33b8b4de3e1b4307706')
md5sums=('310cff925fc2c7b8576946055fde15ce')
md5sums=('6361b5b736e435906e22d5a6acd98d2d')
md5sums=('3d01cdf59e5097e30724c44adbde264d')

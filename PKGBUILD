# Maintainer: CarsonGraham <carson42g at gmail dot com>
pkgname=gumboscript
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="A simple programing language"
arch=('any')
url="https://gumboscript.gumbocoin.com"
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
    cd "GumboScript-$pkgver"
    ./gradlew shadowJar
}

package() {
    cd "GumboScript-$pkgver"
    mkdir "$pkgdir/usr"
    mkdir "$pkgdir/usr/bin"
    install "./bin/gumboscript" "$pkgdir/usr/bin/gumboscript"

    mkdir "$pkgdir/opt"
    mkdir "$pkgdir/opt/gumboscript"
    install "./build/libs/gumboscript-all.jar" "$pkgdir/opt/gumboscript/gumboscript.jar"
}
md5sums=('c26b5f4ace053ddb76d680bb54498ccb')

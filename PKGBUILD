# Maintainer: Clar Fon <usr@ltdk.xyz>
# Contributor: Johann CAHIER <johann.cahier@iot.bzh>
pkgname=mustach
pkgver=1.1.0
pkgrel=1
pkgdesc="mustach is a C implementation of the mustache template specification."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/jobol/mustach/"
license=('ISC')
depends=('json-c')
makedepends=('gcc' 'make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/jobol/mustach/-/archive/$pkgver/mustach-$pkgver.zip")
noextract=()
sha256sums=('a31ede8351e03ae0c87d9d79fcbe40eef11daf6587f13c583847c5142bb3986e')
validpgpkeys=()

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
}

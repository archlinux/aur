# Maintainer: Clar Fon <usr@ltdk.xyz>
# Contributor: Johann CAHIER <johann.cahier@iot.bzh>
pkgname=mustach
pkgver=1.2.10
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
sha256sums=('ff4d2f1505c78b40e3cb00c0208a1f17ca65cf40c9e211102f59828224db07ba')
validpgpkeys=()

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
}

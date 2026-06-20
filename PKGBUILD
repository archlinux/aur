# Maintainer: Dominik Kummer <devel@arkades.org>
# Contributor: Johann CAHIER <johann.cahier@iot.bzh>
pkgname=mustach
pkgver=1.2.10
pkgrel=1
pkgdesc="mustach is a C implementation of the mustache template specification."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/jobol/mustach/"
license=('0BSD')
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
source=("https://gitlab.com/jobol/mustach/-/archive/$pkgver/mustach-$pkgver.tar.gz")
noextract=()
sha256sums=('95a2a351e748db9eeb98f40ba8bfbf010c1c6d2e725d31a3c7e602526d05bf90')
validpgpkeys=()

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
}

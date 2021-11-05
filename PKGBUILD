# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>
pkgname=simavr-picsimlab
_pkgbasename=simavr
pkgver=1.6a
pkgrel=1
pkgdesc="a lean, mean and hackable AVR simulator for linux & OSX - picsimlab fork"
arch=('x86_64' 'aarch64')
url="https://github.com/lcgamboa/simavr"
provides=('simavr')
conflicts=('simavr')
license=('GPL3')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('430d561ea0be5d316a56181ff7843208dd4aa9aba54e05216c24e08c20b89ea7')

build() {
    cd "${_pkgbasename}-$pkgver"
    make RELEASE=1 build-simavr
}

package() {
    cd "${_pkgbasename}-$pkgver"
    make DESTDIR="$pkgdir/usr" PREFIX="/usr" RELEASE=1 install
}

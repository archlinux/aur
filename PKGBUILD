# Maintainer: Endg4me_ <timka.tarasen at gmail.com>
pkgname=lrcsnc
pkgver=0.1.3
pkgrel=1
pkgdesc="🎶 Synced lyrics fetcher and synchronizer that works with any of your MPRIS-capable players!"
arch=('x86_64' 'aarch64')
url="https://github.com/Endg4meZer0/lrcsnc"
license=('MIT')
makedepends=('go>=1.23')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Endg4meZer0/lrcsnc/archive/v${pkgver}.tar.gz")
sha256sums=('b17fab8f4043dddf7078c2cb508141412a86af8e1c996114945f9825df407612')

build() {
    export GOPATH="$srcdir/gopath"
    export GOFLAGS="-mod=readonly -modcacherw"

    cd "$srcdir/$pkgname-$pkgver"
    make VERSION="v$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make VERSION="v$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
}
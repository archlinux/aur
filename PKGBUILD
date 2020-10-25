# Maintainer: Gavin Beatty <public at gavinbeatty dot com>
_pkgname=imgcat
pkgname=$_pkgname-trashhalo
pkgver=1.0.2
pkgrel=1
pkgdesc="Tool to output images in the terminal."
arch=(i686 x86_64 armv6h armv7h aarch64)
url="https://github.com/trashhalo/imgcat"
license=(MIT)
provides=(imgcat)
conflicts=(imgcat-git imgcat-bin)
makedepends=(go)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('d7a8cfff4bf298d578872f0cdb6e30fde280e28edec3939b0553f3b8ee16164f')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    mkdir -p build
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    go build -o build .
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm0755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

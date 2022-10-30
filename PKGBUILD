# Maintainer: Piotr Czajka <czajka@protonmail.com>
pkgname=screentime
pkgver=0.2.4
pkgrel=1
pkgdesc="A lightweight screen-time monitoring tool"
url="https://github.com/Ginkooo/screentime"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
source=("screentime::git+https://github.com/ginkooo/screentime.git#branch=main")
sha256sums=("SKIP")

pkgver() {
    (git describe --long --tags || echo "$pkgver") | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    return 0
}

package() {
    cd ..
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    cargo install --no-track --path $srcdir/$pkgname --root "$usrdir"
}


# Maintainer: Lukas Krickl <lukas@krickl.dev>
pkgname=mji
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool for easily creating git commit messages using gitmoji"
url="https://github.com/unlink2/mji"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")

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
    cargo install --no-track --path . --root "$usrdir"
}


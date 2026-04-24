# Maintainer: holaguz <agustin dot catellani at gmail dot com>
# Maintainer: Nikita Goncarenko <myftr12394 at gmail dot com>
pkgname=tlescope-git
pkgver=3.9.2.32478fd
pkgrel=1
pkgdesc="TLEscope is a satellite visualization tool designed to transform Two-Line Element (TLE) sets into intuitive, interactive data."
arch=("x86_64")
url="https://github.com/aweeri/TLEscope"
license=("AGPL-3")
provides=("TLEscope")
conflicts=(tlescope-bin)

depends=(gcc libx11 libgl curl)
makedepends=(git make)

source=("$pkgname::git+https://github.com/aweeri/TLEscope")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$srcdir/$pkgname"
        make
}

package() {
        cd "$srcdir/$pkgname"
        make DESTDIR="$pkgdir/" install
}

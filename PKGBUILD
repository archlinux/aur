# Maintainer: juanvel400 <me@juanvel400.com>
pkgname=usc
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="a tiny link shortener"
arch=(x86_64)
url="https://sr.ht/~juanvel400/usc"
license=('BSD-3-Clause')
groups=()
depends=(gdbm)
makedepends=(meson ninja)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://dl.juanvel400.com/usc/usc-$pkgver.tar.xz")
noextract=()
sha256sums=('68f0fb0138c5c36bdcb0fcd21279ec60263585ed0d5159235eb9a051dc1e621a')
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    meson setup build \
        --prefix=/usr \
        --buildtype=release \
        --localstatedir=/var
    meson compile -C build
}

check() {
    cd "$pkgname-$pkgver"
    meson test -C build
}

package() {
    cd "$pkgname-$pkgver"
    meson install -C build --destdir="$pkgdir/"
}

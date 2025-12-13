# Maintainer: sunn4room <sunn4room@163.com>
pkgname=pbar-git
pkgver=r28.b303f89
pkgrel=1
pkgdesc="A featherweight text-rendering wayland statusbar."
arch=(x86_64)
url="https://codeberg.org/sunn4room/pbar"
license=("MIT")
depends=("wayland" "pixman" "fcft")
makedepends=("wayland" "pixman" "fcft" "tllist" "pkg-config")
provides=("pbar")
conflicts=("pbar")
source=("$pkgname::git+https://codeberg.org/sunn4room/pbar.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "pbar" "$pkgdir/usr/bin/pbar"
}

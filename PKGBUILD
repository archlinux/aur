# Maintainer: sunn4room <sunn4room@163.com>
pkgname=pipebar-git
pkgver=r31.e4075a9
pkgrel=1
pkgdesc="A featherweight text-rendering wayland statusbar."
arch=(x86_64)
url="https://codeberg.org/sunn4room/pipebar"
license=("MIT")
depends=("wayland" "pixman" "fcft")
makedepends=("wayland" "pixman" "fcft" "tllist" "pkg-config")
provides=("pipebar")
conflicts=("pipebar")
source=("$pkgname::git+https://codeberg.org/sunn4room/pipebar.git")
md5sums=("SKIP")
options=('!debug')

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
    install -Dm755 "pipebar" "$pkgdir/usr/bin/pipebar"
}

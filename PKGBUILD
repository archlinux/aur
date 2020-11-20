# Maintainer: hitori <hitori.gm@gmail.com>
# Contributor: Roshless
pkgname=evhz-git
pkgver=r28.2c94d6f
pkgrel=1
pkgdesc="Display the current mouse refresh rate"
arch=('any')
url="https://git.sr.ht/~iank/evhz"
license=('GPL3')
makedepends=('git')
source=('evhz-git::git+https://git.sr.ht/~iank/evhz')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    gcc -o evhz evhz.c
}

package() {
    install -Dm755 "$pkgname/evhz" "$pkgdir/usr/bin/evhz"
}

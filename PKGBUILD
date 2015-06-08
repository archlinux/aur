# Maintainer: hitori <hitori.gm at gmail dot com>
pkgname=evhz-git
pkgver=r19.479040c
pkgrel=2
pkgdesc="Display the current mouse refresh rate"
arch=('any')
url="https://github.com/ian-kelling/evhz"
license=('GPL3')
makedepends=('git')
source=('evhz-git::git://github.com/ian-kelling/evhz')
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

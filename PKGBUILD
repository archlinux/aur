# Maintainer: hitori <hitori.gm at gmail dot com>
pkgname=evhz-git
pkgver=r24.1c5e722
pkgrel=3
pkgdesc="Display the current mouse refresh rate"
arch=('any')
url="https://gitlab.com/iankelling/evhz"
license=('GPL3')
makedepends=('git')
source=('evhz-git::git+https://gitlab.com/iankelling/evhz.git')
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

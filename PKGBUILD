# Maintainer: gaulerie <arch@0x404.org>
pkgname=asmatrix-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Matrix rain in pure x86-64 Linux assembly"
arch=('x86_64')
url="https://github.com/ungaul/asmatrix"
license=('MIT')
depends=('glibc')
makedepends=('git' 'nasm')
provides=('asmatrix')
conflicts=('asmatrix')
source=("$pkgname::git+https://github.com/ungaul/asmatrix.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    install -Dm755 asmatrix "$pkgdir/usr/bin/asmatrix"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

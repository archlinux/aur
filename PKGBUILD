# Maintainer: Germanphoneguy <germanTECH@web.de>

pkgname=8fetch
pkgver=2
pkgrel=1
pkgdesc="A minimal system information fetch tool"
arch=('x86_64' 'aarch64')
url="https://github.com/quinnyfoco-design/8fetch"
license=('AGPL-3.0-or-later')
depends=('bash')
makedepends=('git' 'gcc')

source=("git+https://github.com/quinnyfoco-design/${pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$pkgname"
    gcc -O2 -o 8fetch myfetch.c
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 8fetch "$pkgdir/usr/bin/8fetch"
}

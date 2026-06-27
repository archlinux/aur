# Maintainer: Tokyob0t <tokyob0t.business[at]proton.me>

_pkgname=lua-succulent
pkgname="$_pkgname-git"
pkgver=0.1.0.r0.gfc31cc9
pkgrel=1
pkgdesc="Lua functions and utilities for Hilbish"
arch=('any')
url="https://github.com/rosettea/succulent"
license=('MIT')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
    cd "$pkgname"

    install -Dm644 init.lua \
        "$pkgdir/usr/share/hilbish/libs/succulent/init.lua"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}

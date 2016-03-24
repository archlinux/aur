pkgname="mcabber-module-autojoin"
pkgver=1.0
pkgrel=1
pkgdesc="Provides autojoining for rooms without bookmarks"
url="https://github.com/seletskiy/mcabber-autojoin"
arch=('any')
license=('GPL')
makedepends=()
source=(git+https://github.com/seletskiy/mcabber-autojoin)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/mcabber-autojoin"

    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/mcabber-autojoin"

    make
}

package() {
    install -D "$srcdir/mcabber-autojoin/libautojoin.so" "$pkgdir/usr/lib/mcabber/libautojoin.so"
}

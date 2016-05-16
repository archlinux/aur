pkgname="mcabber-module-highlight-git"
pkgver=2.50a3271
pkgrel=1
pkgdesc="An mcabber plugin to highlight specified messages (use with mcabber-crew-extended)"
url="https://github.com/seletskiy/mcabber-highlight"
arch=('any')
license=('GPL')
makedepends=()
source=(git+https://github.com/seletskiy/mcabber-highlight)
md5sums=(SKIP)

pkgver() {
    cd "mcabber-highlight"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "mcabber-highlight"

    make
}

package() {
    install -D "$srcdir/mcabber-highlight/libhighlight.so" "$pkgdir/usr/lib/mcabber/libhighlight.so"
}

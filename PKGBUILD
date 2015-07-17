pkgname="mcabber-module-focus"
pkgver=3.d92e41c
_commit=d92e41c
pkgrel=1
pkgdesc="autoleaving focus for mcabber"
url="https://github.com/kovetskiy/mcabber-focus"
arch=('any')
license=('GPL')
makedepends=()
source=(git+https://github.com/kovetskiy/mcabber-focus)
md5sums=(SKIP)

pkgver() {
    cd "mcabber-focus"
    git checkout $_commit
    echo $(git rev-list --count $_commit).$(git rev-parse --short $_commit)
}

build() {
    cd "$srcdir/mcabber-focus"

    make
}

package() {
    install -D "$srcdir/mcabber-focus/libfocus.so" "$pkgdir/usr/lib/mcabber/libfocus.so"
}

pkgname="slorry"
pkgver=11.a4182ba
pkgrel=1
pkgdesc="russian post console tracker"
url="https://github.com/seletskiy/slorry"
arch=('any')
license=('GPL')
makedepends=()
source=(git+https://github.com/seletskiy/slorry)
md5sums=(SKIP)

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/$pkgname"

    make
}

package() {
    install -Dm755 $srcdir/$pkgname/tracker "$pkgdir/usr/bin/slorry"
}

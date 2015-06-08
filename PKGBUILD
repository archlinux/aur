# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=goplot
pkgver=1.0
pkgrel=1
pkgdesc="goplot is an easy to use plotting tool written in golang."
arch=('any')
url="https://github.com/skoo87/goplot"
license=('other')
makedepends=('git' 'go')
source=("$pkgname"::'git://github.com/skoo87/goplot.git')
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    go build
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    for e in $srcdir/$pkgname/examples/*; do
        install -Dm644 "$e" "$pkgdir/usr/share/doc/$pkgname/examples/${e##*/}"
    done
    for i in $srcdir/$pkgname/image/*; do
        install -Dm644 "$i" "$pkgdir/usr/share/doc/$pkgname/image/${i##*/}"
    done
}

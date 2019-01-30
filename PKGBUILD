# Maintainer: Zanny <lordzanny@gmail.com>
pkgname=pakextract
pkgver=r14.55d4ca2
pkgrel=1
pkgdesc="A small tool to extract pak files"
arch=(i686 x86_64)
url="https://github.com/yquake2/pakextract"
license=('BSD')
makedepends=('git')
source=("git+https://github.com/yquake2/$pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -D -m 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m 644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

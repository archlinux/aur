# Maintainer Arthur Shevchenko <niktob560@yandex.ru>

pkgbase=rssfs
pkgname=rssfs
pkgver=r22.7c77092
pkgrel=1
pkgdesc="Mirror RSS and Atom feeds as file systems"
license=('MIT')
source=(
    "git+https://github.com/dertuxmalwieder/rssfs"
)
arch=('x86_64')
provides=('rssfs')
sha1sums=('SKIP')
makedeps=(
    go
    git
)

build() {
    cd $srcdir/$pkgname
    go build
}

package() {
    cd $srcdir/$pkgname
    mkdir -p $pkgdir/usr/bin/
    install -m 0555 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#vim: syntax=sh

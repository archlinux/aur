# Maintainer: Martí Comas <m4rti21@proton.me>
pkgname='book-git'
pkgver=r56.4ff1893
pkgrel=1
pkgdesc='A simple bookmark manager written in go'
arch=('x86_64')
url="https://github.com/M4rti21/book"
license=('GPL')
makedepends=('git' 'go')
source=("${pkgname}::git+http://github.com/M4rti21/book.git")
md5sums=('SKIP')
options=('!debug')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    go build
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "./book" "$pkgdir/usr/bin/book"
    install -Dm644 "./README.md" "$pkgdir/usr/share/doc/book"
}

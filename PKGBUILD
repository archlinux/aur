pkgname=multipart-parser-c-git
pkgver=r37.772639c
pkgrel=1
pkgdesc='Http multipart parser implemented in C'
arch=(x86_64)
url='https://github.com/iafonov/multipart-parser-c'
license=(MIT)
makedepends=('git')
provides=(multipart-parser-c)
conflicts=(multipart-parser-c)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd multipart-parser-c
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd multipart-parser-c

    make solib
}

package () {
    cd multipart-parser-c

    install -Dm0644 -t "$pkgdir/usr/include/" multipart_parser.h
    install -Dm0644 -t "$pkgdir/usr/lib/" libmultipart.so
}

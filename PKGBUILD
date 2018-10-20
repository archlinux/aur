# Maintainer: Erick Pires pires@erickpires.com
pkgname=apascan-git
pkgver=1.efa05cb
pkgrel=1
pkgdesc="PlayStation 2 hard drive partition scanner for Linux."
arch=("i686" "x86_64")
url="https://github.com/chewi/apascan"
license=('GPL v2')
makedepends=('git' 'clang' 'gcc' 'make')
source=('apascan-git::git+https://github.com/chewi/apascan.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"
    ./configure
    make
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm755 apascan "$pkgdir/usr/bin/apascan"
}

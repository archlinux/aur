# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname=kaar-git
_pkgname=kaar
pkgver=r10.853efc1
pkgrel=1
pkgdesc='Kubernetes Application Archive'
arch=('x86_64')
url='https://github.com/kris-nova/kaar'
makedepends=(
    "go"
    "git"
    "make"
)
license=('Apache')
source=("git+https://github.com/kris-nova/kaar.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 kaar "$pkgdir"/usr/bin/kaar
}

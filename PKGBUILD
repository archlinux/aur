# Maintainer: Andrea Dissabo <tronco2018dev@gmail.com>
pkgname=uarty-git
pkgver=r18.a2a6998
pkgrel=1
arch=('x86_64')

license=('GPL3')
depends=()
makedepends=('cmake' 'make' 'gcc' 'git')

source=('git+https://github.com/Tronco2018/Uarty.git')
sha256sums=('SKIP')

options=(!debug)


pkgver() {
    cd "$srcdir/Uarty"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/Uarty"
    cmake -S "$srcdir/Uarty/" -B build
    cmake --build "build"
}

package() {
    install -Dm755 "$srcdir/Uarty/build/Uarty" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Wang Ruochen <arch@ruo-chen.wang>
pkgname=alwaysatty-git
pkgver=r3.1e23181
pkgrel=2
pkgdesc="Always treat stdout as a tty"
arch=('x86_64')
url="https://github.com/weirane/alwaysatty"
license=('MIT')
depends=('sh')
makedepends=('git' 'gcc')
source=("${pkgname%-git}::git+https://github.com/weirane/alwaysatty")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}

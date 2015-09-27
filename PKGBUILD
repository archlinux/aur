# Maintainer: rmanne <rahul_manne@hotmail.com>
pkgname=tutch-git
pkgver=r3.b199eff
pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc='Whole-program, optimizing Standard ML compiler'
arch=('x86_64' 'i686')
url="http://www2.tcs.ifi.lmu.de/~abel/tutch/"
license=('unknown')
depends=('gmp')
makedepends=('mlton-git')
provides=('tutch')
conflicts=('tutch')
source=('tutch::git+https://github.com/rmanne/tutch.git')
md5sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname%-git}"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 src/tutch "$pkgdir/usr/bin/tutch"
}

# Maintainer: Christopher Michael Mescher $(echo \<pascha-mescher+faith\>|sed s/\+/./g\;s/\-/@/)

pkgname=metabeta-git
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgver=1.0.r0.gdb3039b
pkgrel=1

pkgdesc="A simple CLI program to convert between Greek and Beta Code."
arch=('any')
url="https://gitlab.com/cmmescher/metabeta.git"
license=('GPL3')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 metabeta "$pkgdir/usr/bin/metabeta"

}

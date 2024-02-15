# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=md2roff-git
epoch=2
pkgver=r3.e39b1c2
pkgrel=1
pkgdesc="Convert markdown to groff / troff"
arch=("x86_64")
url="https://codeberg.org/nereusx/md2roff"
license=('GPL-3.0')
makedepends=('git' 'gzip')
provides=('md2roff')
conflicts=('md2roff')
source=("${pkgname}::git+https://codeberg.org/nereusx/md2roff.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make  DESTDIR="$pkgdir" prefix=/usr install
}

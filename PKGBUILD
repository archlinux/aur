# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=md2roff-git
pkgver=r98.45c380d
pkgrel=1
pkgdesc="Convert markdown to groff / troff"
arch=("x86_64")
url="https://github.com/nereusx/md2roff"
license=('GPL-3.0')
makedepends=('git' 'gzip')
provides=('md2roff')
conflicts=('md2roff')
source=("${pkgname}::git+https://github.com/nereusx/md2roff")
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

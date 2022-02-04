# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=highlight-pointer-git
pkgver=1.1.3.r0.g32bf4c6
pkgrel=1
epoch=
pkgdesc="Highlight mouse pointer/cursor using a dot"
arch=(any)
url="https://github.com/swillner/highlight-pointer"
license=('GPL')
groups=()
depends=(libx11 libxext libxfixes libxi)
makedepends=(git)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+$url")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

pkgver () {
    cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build () {
    cd "$srcdir/${pkgname%-git}"
    make
}

package () {
    cd "$srcdir/${pkgname%-git}"
    pwd
    ls
    install -m755 -D highlight-pointer -t "$pkgdir"/usr/bin
}

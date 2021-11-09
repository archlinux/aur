# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=python-xdgspec-git
pkgver=0.2.1.r3.g45c3cef
pkgrel=1
epoch=
pkgdesc="XDG Base Directory Specification for Python"
arch=(any)
url="https://gitlab.com/nobodyinperson/python3-xdgspec"
license=('GPL')
groups=()
depends=()
makedepends=(python-setuptools)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=()
replaces=(thunar-plugins-git)
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
    python setup.py build
}

package () {
    cd "$srcdir/${pkgname%-git}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

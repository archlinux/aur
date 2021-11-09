# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=python-polt-git
pkgver=0.12.1.r13.ge8829ab
pkgrel=1
epoch=
pkgdesc="Live plotting with Matplotlib"
arch=(any)
url="https://gitlab.com/nobodyinperson/python3-polt"
license=('GPL')
groups=()
depends=(python-matplotlib python-scipy python-click python-xdgspec)
makedepends=(python-setuptools)
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
    python setup.py build
}

package () {
    cd "$srcdir/${pkgname%-git}"
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# Maintainer: tsipizic 

pkgname="python-yeelight"
pkgver=r118.de91518
pkgrel=1
pkgdesc="Yeelight python library"
arch=("i686" "x86_64")
url="https://gitlab.com/stavros/python-yeelight"
license=("BSD")
depends=("python" "python-future" "python-enum-compat")
makedepends=("git" "python-setuptools")
provides=("python-yeelight")
source=("git+https://gitlab.com/stavros/python-yeelight.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
}


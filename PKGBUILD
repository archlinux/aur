# Maintainer: tsipizic 

pkgname="yeecli"
pkgver=r49.6e391b5
pkgrel=1
pkgdesc="Yeelight CLI tool"
arch=("i686" "x86_64")
url="https://gitlab.com/stavros/yeecli"
license=("BSD")
depends=("python-yeelight")
makedepends=("git" "python-setuptools")
provides=("yeecli")
source=("git+https://gitlab.com/stavros/yeecli.git")
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


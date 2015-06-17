# Maintainer: M0Rf30

pkgname=python-soundcloud-git
pkgver=r89.ac799b0
pkgrel=1
pkgdesc="A Python wrapper around the Soundcloud API"
arch=("i686" "x86_64")
url="https://github.com/soundcloud/soundcloud-python"
license=("BSD")
depends=("python-requests")
makedepends=("git" "python-setuptools")
optdepends=("python-simplejson")
provides=("python-soundcloud")
source=("$pkgname"::"git://github.com/soundcloud/soundcloud-python")
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


# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-fontools
pkgver=0.4.1
pkgrel=1
pkgdesc="FONtools: The Feature Object Notation tools"
arch=("any")
url="https://github.com/vejnar/FONtools"
license=("MPLv2")
depends=("python" "python-pyfnutils" "python-pyfaidx")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://github.com/vejnar/FONtools/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=("f2caaee59649d2ffd2015281575b180f89a3f3de")

build() {
    cd "$srcdir/FONtools-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/FONtools-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

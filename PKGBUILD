# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-fontools
pkgver=0.3
pkgrel=1
pkgdesc="FONtools: The Feature Object Notation tools"
arch=("any")
url="https://github.com/vejnar/fontools"
license=("MPLv2")
depends=("python" "python-pyfnutils" "python-pyfaidx")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://github.com/vejnar/fontools/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=("966b0888d7a50369f9f04b907f6d480a5ede7a72")

build() {
    cd "$srcdir/fontools-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/fontools-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Techcable <Techcable at techcable dot net>
pkgname=python-columnize
pkgver=0.3.10
pkgrel=1
epoch=
pkgdesc="Python module to align a simple (not nested) list in columns."
arch=("any")
url="https://github.com/rocky/pycolumnize"
license=('MIT')
groups=()
depends=()
makedepends=("python-setuptools")
checkdepends=("python-mock" "python-pytest" "python-pytest-cov")
backup=() # Anything we need to backup?
options=()
install=
changelog=
source=("columnize-0.3.0.tar.gz::https://github.com/rocky/pycolumnize/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("c7947a57a126b6e5b4b585a19945909c3e64213979113948968304ebcf23daa4")

prepare() {
    true; # Nothing to do I guess
}

build() {
    cd "pycolumnize-$pkgver"
    python3 ./setup.py build;
}

check() {
    cd "pycolumnize-$pkgver"
    make check;
}

package() {
    cd "pycolumnize-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix="/usr"
}

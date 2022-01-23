# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-wire
pkgver=1.0.0
pkgrel=6
pkgdesc="A convenience wrapper around the built-in SQLite3 module in python"
arch=("any")
url="https://github.com/djmattyg007/python-wire"
license=("GPL3")
depends=("python")
makedepends=("python-setuptools")
source=("https://github.com/djmattyg007/python-wire/archive/${pkgver}.tar.gz")
sha256sums=("4cc8766220b85ed228104b155a338de06acf4718bf300b0bbf5776bd5c72114b")

build() {
    cd "python-wire-${pkgver}"

    python setup.py build
}

package() {
    cd "python-wire-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-wire/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/python-wire/README.md"
}

# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-simplediff
pkgver=1.1
pkgrel=1
pkgdesc="A Python module to annotate two versions of a list with the values that have been changed between the versions, similar to unix's diff but with a dead-simple Python interface."
arch=("any")
url="https://pypi.org/project/simplediff"
license=("custom")
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/s/simplediff/simplediff-${pkgver}.tar.gz")
sha256sums=("db29e82c64ecc083e36308b584fc48985225421f85cb64d899329334ade32bda")

build() {
    cd "simplediff-${pkgver}"

    python setup.py build
}

package() {
    cd "simplediff-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-simplediff/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/python-simplediff/README.md"
}

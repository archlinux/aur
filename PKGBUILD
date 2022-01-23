# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-unstdlib
pkgver=1.7.2
pkgrel=3
pkgdesc="Unstandard Python library of useful and highly-reusable functions."
arch=("any")
url="https://github.com/shazow/unstdlib.py"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/u/unstdlib/unstdlib-${pkgver}.tar.gz")
sha256sums=("ef702a49bea7cefde837b7419f02d0b6274823cc51801ef5b9ba4ccb60227eb0")

build() {
    cd "unstdlib-${pkgver}"

    python setup.py build
}

package() {
    cd "unstdlib-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-unstdlib/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/python-unstdlib/README.md"
}

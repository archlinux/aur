# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-cuddle
pkgver=1.0.3
pkgrel=1
pkgdesc="Python implementation of the KDL Document Language"
arch=("any")
url="https://github.com/djmattyg007/python-cuddle"
license=("MIT")
depends=("python" "python-regex" "python-tatsu")
makedepends=("python-poetry-core" "python-setuptools")
source=("https://pypi.io/packages/source/c/cuddle/cuddle-${pkgver}.tar.gz")
sha256sums=("a5d7066544c8d7d5025436482113a4b03c0595772b9796b393a6414eece716a1")

build() {
    cd "cuddle-${pkgver}"

    python setup.py build
}

package() {
    cd "cuddle-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-cuddle/LICENSE.txt"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/python-cuddle/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/python-cuddle/CHANGELOG.md"
}

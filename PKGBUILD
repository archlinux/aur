# Maintainer: Samsu F <samsu-f AT web DOT de>
# Contributor: Matthew Gamble <git@matthewgamble.net>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jtbl
pkgver=1.6.0
pkgrel=1
pkgdesc="A simple CLI tool to print JSON and JSON Lines data as a table in the terminal"
arch=("any")
url="https://github.com/kellyjonbrazil/jtbl"
license=("MIT")
depends=("python" "python-tabulate")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/j/jtbl/jtbl-${pkgver}.tar.gz")
sha256sums=("7de0cb08ebb2b3a0658229a8edd4204c6944cbd9e3e04724a9ea235a61c115a5")

build() {
    cd "jtbl-${pkgver}"

    python setup.py build
}

package() {
    cd "jtbl-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/jtbl/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/jtbl/README.md"
    install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/jtbl/CHANGELOG"
}

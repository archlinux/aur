# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jtbl
pkgver=1.2.3
pkgrel=1
pkgdesc="A simple CLI tool to print JSON and JSON Lines data as a table in the terminal"
arch=("any")
url="https://github.com/kellyjonbrazil/jtbl"
license=("MIT")
depends=("python" "python-tabulate")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/j/jtbl/jtbl-${pkgver}.tar.gz")
sha256sums=("1bc8d08a75cc584de4e13311e422bbdbec7b9334766cf2725d6862a1463ffa22")

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

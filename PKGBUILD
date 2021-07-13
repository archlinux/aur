# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jtbl
pkgver=1.1.7
pkgrel=1
pkgdesc='Simple cli tool to print JSON and JSON Lines data as a table in the terminal'
arch=("any")
url="https://github.com/kellyjonbrazil/jtbl"
license=("MIT")
depends=("python" "python-tabulate")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/j/jtbl/jtbl-${pkgver}.tar.gz")
sha256sums=("816aae6d72dac92c83273b5d693e8a32fccd696cf36e1f7fac2985dd72cf152e")

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

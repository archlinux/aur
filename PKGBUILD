# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=jtbl
pkgver=1.1.6
pkgrel=2
pkgdesc='Simple cli tool to print JSON and JSON Lines data as a table in the terminal'
arch=("any")
url="https://github.com/kellyjonbrazil/jtbl"
license=("MIT")
depends=("python" "python-tabulate")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/j/jtbl/jtbl-${pkgver}.tar.gz")
sha256sums=("3623d4942b80bbd9f64c2f672c52862dad7e0d1245094a2416f04a09773b8660")

build() {
    cd "jtbl-${pkgver}"

    python setup.py build
}

package() {
    cd "jtbl-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/jtbl/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/jtbl/README.md"

    # https://github.com/kellyjonbrazil/jtbl/issues/5
    #install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/jtbl/CHANGELOG"
}

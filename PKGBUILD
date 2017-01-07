# Maintainer: Matthew Gamble

pkgname=python-simplediff
pkgver=1.0
pkgrel=2
pkgdesc="A Python module to annotate two versions of a list with the values that have been changed between the versions, similar to unix's diff but with a dead-simple Python interface."
arch=("any")
url="https://pypi.python.org/pypi/simplediff"
license=("custom")
depends=("python")
makedepends=("python-setuptools")
source=(
    "https://pypi.python.org/packages/d3/8a/935c48a9364d0d6773ec90a1c042a151ff2f08b99ae1c79b0e08ab01d4a2/simplediff-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/paulgb/simplediff/5e829cb2941e44e5c0387a32bd943ef3f3a2a1d7/python/LICENSE"
)
sha256sums=(
    "574768b33c6714190eaf055ddd1ae86c0723e89c5815c3f09002645c645360b6"
    "4b8682932a656cded5c78d200061da0b1df86909a56bcc68cde53c98deea92bb"
)

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-simplediff/LICENSE"
    cd "simplediff-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-simplediff
pkgver=1.0
pkgrel=6
pkgdesc="A Python module to annotate two versions of a list with the values that have been changed between the versions, similar to unix's diff but with a dead-simple Python interface."
arch=("any")
url="https://pypi.org/project/simplediff"
license=("custom")
depends=("python")
makedepends=("python-setuptools")
source=(
    "https://pypi.io/packages/source/s/simplediff/simplediff-${pkgver}.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/paulgb/simplediff/0a35027c87bfb604b3043645c5e5d861aacf5f90/python/LICENSE"
)
sha256sums=(
    "574768b33c6714190eaf055ddd1ae86c0723e89c5815c3f09002645c645360b6"
    "4b8682932a656cded5c78d200061da0b1df86909a56bcc68cde53c98deea92bb"
)

build() {
    cd "simplediff-${pkgver}"

    python setup.py build
}

package() {
    cd "simplediff-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/python-simplediff/LICENSE"
}

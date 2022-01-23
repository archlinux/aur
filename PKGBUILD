# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=mopidy-bandcamp
pkgver=1.1.5
pkgrel=1
pkgdesc="Mopidy backend for Bandcamp"
arch=("any")
url="https://github.com/impliedchaos/mopidy-bandcamp"
license=("MIT")
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
)
source=("https://pypi.io/packages/source/M/Mopidy-Bandcamp/Mopidy-Bandcamp-${pkgver}.tar.gz")
sha256sums=("c20f7370e29f650461a720350aee70bddc0aa66ae572bda6f66aea0478145c04")

build() {
    cd "Mopidy-Bandcamp-${pkgver}"

    python setup.py build
}

package() {
    cd "Mopidy-Bandcamp-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mopidy-bandcamp/LICENSE"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/mopidy-bandcamp/README.rst"
}

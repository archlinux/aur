# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=mopidy-advanced-scrobbler
pkgver=2.1.0
pkgrel=2
pkgdesc="Mopidy extension for comprehensive management of Last.fm scrobbles"
arch=("any")
url="https://github.com/djmattyg007/mopidy-advanced-scrobbler"
license=("Apache")
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
    "python-pylast"
    "python-music-metadata-filter"
    "python-marshmallow"
    "python-marshmallow-enum"
)
source=("https://pypi.io/packages/source/M/Mopidy-Advanced-Scrobbler/Mopidy-Advanced-Scrobbler-${pkgver}.tar.gz")
sha256sums=("e4ea5cb51082fe51c6d67a5018e18ce8251e68803a7e65eda794f2222a3ece45")

build() {
    cd "Mopidy-Advanced-Scrobbler-${pkgver}"

    python setup.py build
}

package() {
    cd "Mopidy-Advanced-Scrobbler-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 README.rst "${pkgdir}/usr/share/doc/mopidy-advanced-scrobbler/README.rst"
}

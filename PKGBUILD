# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Fergus Longley <ferguslongley at gmail dot com>
# Contributer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-scrobbler
pkgver=2.0.1
pkgrel=2
pkgdesc="Mopidy extension for scrobbling played tracks to Last.fm"
arch=("any")
url="https://github.com/mopidy/mopidy-scrobbler"
license=("Apache")
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
    "python-pylast"
)
source=("https://pypi.io/packages/source/M/Mopidy-Scrobbler/Mopidy-Scrobbler-2.0.1.tar.gz")
sha256sums=("001920edc5433678091cb74c56e39c57ffcdb280396447b07d6fbe4eba7a7d87")

build() {
    cd "Mopidy-Scrobbler-${pkgver}"

    python setup.py build
}

package() {
    cd "Mopidy-Scrobbler-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 README.rst "${pkgdir}/usr/share/doc/mopidy-scrobbler/README.rst"
}

# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-music-metadata-filter
pkgver=3.0.0
pkgrel=1
pkgdesc="A module for cleaning up artist, album, and song names."
arch=("any")
url="https://github.com/djmattyg007/music-metadata-filter"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/m/music-metadata-filter/music-metadata-filter-${pkgver}.tar.gz")
sha256sums=("0b46f7bf69aecac464ea1262fd2af133c5c0e4e71d8124ba8096bb90441543f3")

build() {
    cd "music-metadata-filter-${pkgver}"
    python setup.py build
}

package() {
    cd "music-metadata-filter-${pkgver}"
    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/python-music-metadata-filter/LICENSE.md"
}

# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: tuftedocelot@fastmail.fm
# Contributor: flu

pkgname=mopidy-tunein
pkgver=1.1.0
pkgrel=3
pkgdesc="Mopidy extension for playing music from TuneIn"
arch=("any")
url="https://github.com/kingosticks/mopidy-tunein"
license=("Apache")
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
    "python-requests"
)
source=("https://pypi.io/packages/source/M/Mopidy-TuneIn/Mopidy-TuneIn-${pkgver}.tar.gz")
sha256sums=("910a96552d239bfaee6ef3635cf9018f7ef733ac311cd0b11f27334dbd56c107")

build() {
    cd "Mopidy-TuneIn-${pkgver}"

    python setup.py build
}

package() {
    cd "Mopidy-TuneIn-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 README.rst "${pkgdir}/usr/share/doc/mopidy-tunein/README.rst"
}

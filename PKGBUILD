# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Emanuel Evans <mail@emanuel.industries>

pkgname=mopidy-pandora
pkgver=1.1.1
pkgrel=2
pkgdesc="Mopidy extension for playing music from Pandora"
arch=("any")
url="https://github.com/mopidy/mopidy-pandora"
license=("Apache")
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
    "python-requests"
)
#source=("https://github.com/mopidy/mopidy-pandora/archive/v${pkgver}.tar.gz")
source=("https://pypi.io/packages/source/M/Mopidy-Pandora/Mopidy-Pandora-${pkgver}.tar.gz")
sha256sums=("250adc721ad66a5904829d1c46b1dd6e6fc938c5bcf0b78e27ff1c75e89dafd2")

build() {
    cd "Mopidy-Pandora-${pkgver}"

    python setup.py build
}

package() {
    cd "Mopidy-Pandora-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 README.rst "${pkgdir}/usr/share/doc/mopidy-pandora/README.rst"
    install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/mopidy-pandora/AUTHORS"
}

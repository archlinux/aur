# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=mopidy-webhooks
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple Mopidy extension that sends webhook notifications to a remote URL."
arch=("any")
url="https://github.com/paddycarey/mopidy-webhooks"
license=("Apache")
depends=(
    "mopidy"
    "python"
    "python-setuptools"
    "python-pykka"
    "python-requests"
)
makedepends=("python-setuptools-scm")
source=("https://pypi.io/packages/source/M/Mopidy-Webhooks/Mopidy-Webhooks-${pkgver}.tar.gz")
sha256sums=("d79d7bf628ba0bb7f3d3c5c0f4277e234084e2c8015813e006a9e236369a06d7")

build() {
    cd "Mopidy-Webhooks-${pkgver}"

    python setup.py build
}

package() {
    cd "Mopidy-Webhooks-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm644 README.rst "${pkgdir}/usr/share/doc/mopidy-webhooks/README.rst"
}

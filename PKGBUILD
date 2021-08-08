# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="python-tox-docker"
_pkgname="tox-docker"
pkgver=3.0.0
pkgrel=1
pkgdesc="Tox plugin to run one or more Docker containers during tests"
arch=('any')
url="https://github.com/tox-dev/${_pkgname}"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-tox')
source=("https://github.com/tox-dev/tox-docker/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
sha256sums=('aa944c10b05dcbe13c10c711047813e401fcb0626491e1392928bb002605e316')

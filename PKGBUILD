# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-dreg-client
pkgver=1.1.0
pkgrel=1
pkgdesc="Python API client for Docker Registries"
arch=("any")
url="https://github.com/djmattyg007/dreg-client/"
license=("Apache")
depends=("python" "python-requests" "python-requests-toolbelt")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/d/dreg-client/dreg-client-${pkgver}.tar.gz")
sha256sums=("e716be31114d7fae9b7c0899796d81111716a9e2baea81311efbac249e1ea767")

build() {
    cd "dreg-client-${pkgver}"

    python setup.py build
}

package() {
    cd "dreg-client-${pkgver}"

    PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    #install -Dm755 docker-registry-show.py "${pkgdir}/usr/lib/python-dreg-client/docker-registry-show.py"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-dreg-client/LICENSE.txt"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/python-dreg-client/README.rst"
    install -Dm644 CHANGELOG.rst "${pkgdir}/usr/share/doc/python-dreg-client/CHANGELOG.rst"
}

pkgbase=python-hydrus
pkgname=("python-hydrus")
pkgver=1.11.4
pkgrel=1
pkgdesc="Python module implementing the Hydrus API."
arch=("any")
url="https://gitlab.com/cryzed/hydrus-api"
license=("GPLv3")
depends=("python" "python-requests")
makedepends=("python-setuptools" "python-requests")
source=("https://gitlab.com/cryzed/hydrus-api/-/archive/v${pkgver}/hydrus-api-v${pkgver}.tar.gz")
sha512sums=('2dfa60b06925c6103e98eade00387e73d56e0caac3bf101fa2196f227a559e78a678cdc9ebb2234eedd8c06dee5c02f79e635fa9dcd6744f643168c7470b4b60')

build() {
    cd "${srcdir}/hydrus-api-v${pkgver}"
    python setup.py build
}

package_python-hydrus() {
    cd "${srcdir}/hydrus-api-v${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

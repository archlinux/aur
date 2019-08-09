pkgbase=python-hydrus
pkgname=("python-hydrus")
pkgver=10
pkgrel=1
pkgdesc="Python module implementing the Hydrus API."
arch=("any")
url="https://gitlab.com/cryzed/hydrus-api"
license=("GPLv3")
depends=("python" "python-requests")
makedepends=("python-setuptools" "python-requests")
source=("https://gitlab.com/cryzed/hydrus-api/-/archive/v${pkgver}/hydrus-api-v${pkgver}.tar.gz")
sha512sums=('5e2898319a98e39fcd46571aacf500b9fdafa06b43e933c188bbdd3a22b98e9d5b765c83eee26c7c45245a7ac8a56e62780b5825eb1a7ebf1da6e4a620e18abe')

build() {
    cd "${srcdir}/hydrus-api-v${pkgver}"
    python setup.py build
}

package_python-hydrus() {
    cd "${srcdir}/hydrus-api-v${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

pkgbase=python-hydrus
pkgname=("python-hydrus")
pkgver=11
pkgrel=1
pkgdesc="Python module implementing the Hydrus API."
arch=("any")
url="https://gitlab.com/cryzed/hydrus-api"
license=("GPLv3")
depends=("python" "python-requests")
makedepends=("python-setuptools" "python-requests")
source=("https://gitlab.com/cryzed/hydrus-api/-/archive/v${pkgver}/hydrus-api-v${pkgver}.tar.gz")
sha512sums=('a5b35bcde34de65fa690a199cc653540607fbf6728bfc001305584562f636c3156537d7b0edee55617cdda6ae914f5fff532cbf588d1fe043c0d0f3edb328af8')

build() {
    cd "${srcdir}/hydrus-api-v${pkgver}"
    python setup.py build
}

package_python-hydrus() {
    cd "${srcdir}/hydrus-api-v${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

# Maintainer: fenuks

pkgbase=ropemode
pkgname=(python-${pkgbase} python2-${pkgbase})
pkgver=0.4
pkgrel=1
pkgdesc="Ropemode, a helper for using rope refactoring library in IDEs"
arch=("any")
url="https://pypi.python.org/pypi/${pkgbase}"
license=("GPL")
depends=()
optdepends=()
makedepends=("python-setuptools" "python2-setuptools")
conflicts=()
# install=$pkgname.install
source=("https://pypi.python.org/packages/f2/a4/9901c33b32f2d4c2f3bfdc656ec1fe5b7914fcfcfc2f783ff17c070a77e3/ropemode-0.4.tar.gz")
md5sums=('54c52d19e43cae5ab06f49c6404f734f')
sha256sums=('66cdae6bc63baac894f8d26583c193ee86ad48c72b3da59fb4a77d9973cf4393')

build_python-ropemode() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py build
}

build_python2-ropemode() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python2 setup.py build
}

package_python-ropemode() {
    depends=(python-rope)
    provides=(python-${pkgbase})
    conflicts=(python-${pkgbase})

    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-ropemode() {
    depends=(python2-rope)
    provides=(python2-${pkgbase})
    conflicts=(python2-${pkgbase})

    cd "${srcdir}/${pkgbase}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}

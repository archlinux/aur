# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-mmcif
_module=mmcif
pkgver=0.76
pkgrel=1
pkgdesc="mmCIF Core Access Library"
arch=(x86_64)
url="http://mmcif.wwpdb.org"
license=('Apache')
makedepends=(pybind11)
depends=(python python-future python-six python-requests python-msgpack)
makedepends=()
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('357a3e67dae23a803c81011f3fde289bafd1ad99d03870042fe6ccaa2adb5de6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

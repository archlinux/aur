# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-mmcif
_module=mmcif
pkgver=0.81
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
sha256sums=('dbe686cbeb500bf04a3e73e2858e1285ab19530e24d230a6d74654f24178c379')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

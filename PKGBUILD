# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-networkmanager
_pypi_pkgname=python-networkmanager
pkgver=2.0.1
pkgrel=1
pkgdesc="Easy communication with NetworkManager"
arch=(any)
url="https://github.com/seveas/python-networkmanager"
license=('Zlib')
makedepends=('python-setuptools')
depends=('python' 'networkmanager')
source=("https://pypi.io/packages/source/p/python-networkmanager/python-networkmanager-${pkgver}.tar.gz")
md5sums=('5fc644a65463031295c6b7dd51a0f1bd')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

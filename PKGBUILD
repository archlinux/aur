# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-networkmanager
_pypi_pkgname=python-networkmanager
pkgver=2.1
pkgrel=1
pkgdesc="Easy communication with NetworkManager"
arch=(any)
url="https://github.com/seveas/python-networkmanager"
license=('zlib')
makedepends=('python-setuptools')
depends=('python' 'networkmanager')
source=("https://pypi.io/packages/source/p/python-networkmanager/python-networkmanager-${pkgver}.tar.gz")
sha256sums=('aef1e34d98d7bec7cc368e0ca0f2e97493f9b5ebe6d7103f8f6460cfca3dc6fc')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}

# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=findimports
pkgver=2.2.0
pkgrel=1
pkgdesc="Python module import analysis tool"
url="https://github.com/mgedmin/findimports"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d47a1303e35095017c5e1da15305ae799510e72a1094101afed0c6f31a4e57cd')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

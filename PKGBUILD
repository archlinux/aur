# Maintainer: Jiachen YANG <farseerfc@gmail.com>

pkgname=python-hs-dbus-signature
_pkgname=hs-dbus-signature
pkgver=0.7
pkgrel=8
pkgdesc="dbus signature hypothesis strategy generator"
url="https://pypi.org/project/hs-dbus-signature/"
depends=('python-hypothesis')
makedepends=('python' 'python-setuptools')
license=('MPL-2.0')
arch=('any')
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('34d9d37125fe2bccd4fac8f5401775de1eda11737d56a96d24c3560ae86067a2')

check() {
    cd ${_pkgname}-${pkgver}
    PYTHONPATH=src python -m unittest discover -vs .
}
 
build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 
}

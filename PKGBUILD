# Maintainer: leepesjee <lpeschier at xs4all dot nl>
pkgname=('python-pybliometrics')
_pkgname="pybliometrics"
pkgver=2.9.1
pkgrel=1
pkgdesc="A python-based API-wrapper to access Scopus"
arch=('any')
url="https://pybliometrics.readthedocs.io/en/stable/"
license=('MIT')
depends=('python-pbr'  'python-requests' 'python-simplejson')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('c5dccbb479657d5c25404a61776e536d')

build() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py install --root=$pkgdir/ --optimize=1 --skip-build
    install -Dm644 $srcdir/${_pkgname}-${pkgver}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

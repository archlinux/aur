pkgname=('python-gpapi' 'python2-gpapi')
pkgbase=python-gpapi
pkgver=0.2.2
pkgrel=1
pkgdesc="Google Play Unofficial Python API "
url="https://github.com/NoMore201/googleplay-api"
arch=('any')
license=('GPL3')
makedepends=("python-setuptools" "python2-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/NoMore201/googleplay-api/archive/v${pkgver}.tar.gz")
md5sums=('ceb61ba58413bee80ac1a0123db2f679')
 
package_python-gpapi() {
    depends=("python")
    cd googleplay-api-$pkgver
    python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-gpapi() {
    depends=("python2")
    cd googleplay-api-$pkgver
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    find "$pkgdir" -name '*.py' -exec sed -i 's|#!/usr/bin/python$|#!/usr/bin/python2|g' {} \;
}

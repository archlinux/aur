pkgname=('python-gpapi' 'python2-gpapi')
pkgbase=python-gpapi
pkgver=0.4.3
pkgrel=1
pkgdesc="Google Play Unofficial Python API "
url="https://github.com/NoMore201/googleplay-api"
arch=('any')
license=('GPL3')
makedepends=("python-setuptools" "python2-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/NoMore201/googleplay-api/archive/v${pkgver}.tar.gz")
md5sums=('c9dc7e1c38656e4117c5970773331279')
 
package_python-gpapi() {
    depends=("python" "python-crypto" "python-protobuf" "python-clint" "python-requests")
    cd googleplay-api-$pkgver
    python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-gpapi() {
    depends=("python2" "python2-crypto" "python2-protobuf" "python2-clint" "python2-requests")
    cd googleplay-api-$pkgver
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    find "$pkgdir" -name '*.py' -exec sed -i 's|#!/usr/bin/python$|#!/usr/bin/python2|g' {} \;
}

# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase=python-zerodb
pkgname=("python-zerodb" "python2-zerodb")
pkgver=0.99.0b1
pkgrel=1
pkgdesc="An end-to-end encrypted database protocol client"
url="http://www.zerodb.io/"
arch=('any')
license=('AGPL')
source=("https://pypi.python.org/packages/25/9e/66ffd73b02ac3ca103a250a0bc0efb310a4a0d5136bcb2b12453c5081293/zerodb-0.99.0b1.tar.gz")
md5sums=('1dae15ddd452bde0f287f2a06e60d8d1')

package_python-zerodb() {
    depends=('python', 'python-setuptools' 'python-transaction')
    cd "${srcdir}/zerodb-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-zerodb() {
    depends=('python2', 'python2-setuptools' 'python2-transaction')
    cd "${srcdir}/zerodb-$pkgver"
    find . -name "*.py" -exec sed -i 's#/usr/bin/env python#/usr/bin/env python2#' {} \;
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}

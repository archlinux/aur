# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase=python-zerodb
pkgname=("python-zerodb" "python2-zerodb")
pkgver=0.99.0a2
pkgrel=1
pkgdesc="An end-to-end encrypted database protocol client"
url="http://www.zerodb.io/"
arch=('any')
license=('AGPL')
source=("https://pypi.python.org/packages/68/07/cd072e706023074be152e7dd75a642ce5be29e67191a5c18e5da8b65d8ba/zerodb-0.99.0a2.tar.gz")
md5sums=('49834f86e2828cba7e56c253034321ce')

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

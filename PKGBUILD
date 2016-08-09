# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase=python-zerodb
pkgname=("python-zerodb" "python2-zerodb")
pkgver=0.99.0a3
pkgrel=1
pkgdesc="An end-to-end encrypted database protocol client"
url="http://www.zerodb.io/"
arch=('any')
license=('AGPL')
source=("https://pypi.python.org/packages/f9/6c/ddcbb9499a57166e3a21ece4d3a7d0f61dad45ce5ebcf14e337998d31cde/zerodb-0.99.0a3.tar.gz")
md5sums=('3e74c5c6c9e3149e7bef7e02015f3652')

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

# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase=python-zerodb
pkgname=("python-zerodb" "python2-zerodb")
pkgver=0.98.0
pkgrel=1
pkgdesc="An end-to-end encrypted database protocol client"
url="http://www.zerodb.io/"
arch=('any')
license=('AGPL')
source=("https://pypi.python.org/packages/60/e2/cd05dd40a790c97e1b373d38ea14cc4f25ada45e8d77d3581a0fb831df3a/zerodb-0.98.0.tar.gz")
md5sums=('3a7da730682c754d9b8d6aaff43d88cb')

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

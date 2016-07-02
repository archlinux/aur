# Maintainer: fordprefect <fordprefect@dukun.de>
pkgbase=python-zerodb
pkgname=("python-zerodb" "python2-zerodb")
pkgver=0.97.6
pkgrel=1
pkgdesc="An end-to-end encrypted database protocol client"
url="http://www.zerodb.io/"
arch=('any')
license=('AGPL')
source=("https://pypi.python.org/packages/e0/7c/da94fd2bb9f01609d4f10b02d5a1dc7c546ae3cb78b7924b0885b85c84a7/zerodb-0.97.6.tar.gz")
md5sums=('d67616d7dc01cc049ab4e4f3235d76be')

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

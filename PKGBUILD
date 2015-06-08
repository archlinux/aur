# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=('python-wcwidth' 'python2-wcwidth')
pkgver=0.1.4
pkgrel=1
pkgdesc="Measures number of Terminal column cells of wide-character codes"
url="https://github.com/jquast/wcwidth"
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/w/wcwidth/wcwidth-${pkgver}.tar.gz")
sha512sums=('3882d7a4309b868593586e7bc52ce5328504db2f37a4152d53a8b7b8632375866cc07900965d1dd9c84d22c4e2b5cb161b3091c6b3ce4a37d51aeca9c76fe36d')

prepare() {
    cp -a "${srcdir}/wcwidth-${pkgver}"{,-python2}
}

package_python-wcwidth() {
    depends=('python')
    makedepends=('python-setuptools')
    cd "wcwidth-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-wcwidth() {
    depends=('python2')
    makedepends=('python2-setuptools')
    cd "wcwidth-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

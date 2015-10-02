# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=('python-wcwidth' 'python2-wcwidth')
pkgver=0.1.5
pkgrel=2
pkgdesc="Measures number of Terminal column cells of wide-character codes"
url="https://github.com/jquast/wcwidth"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/w/wcwidth/wcwidth-${pkgver}.tar.gz")
sha512sums=('1235a3fecea0a18d0c3fe160fd3518e05b37b64a232ce3e8a17dee102d6a6d06095c395b07bbd6a812723a78c44df5afaae19c479dae591b6c9aecb3d0001173')

prepare() {
    cp -a "${srcdir}/wcwidth-${pkgver}"{,-python2}
}

package_python-wcwidth() {
    depends=('python')
    cd "wcwidth-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-wcwidth() {
    depends=('python2')
    cd "wcwidth-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

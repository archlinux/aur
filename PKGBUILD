# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=('python-wcwidth' 'python2-wcwidth')
pkgver=0.1.6
pkgrel=1
pkgdesc="Measures number of Terminal column cells of wide-character codes"
url="https://github.com/jquast/wcwidth"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/w/wcwidth/wcwidth-${pkgver}.tar.gz")
sha512sums=('da22fbbd8172673532b47d07f5285fbbb1c9e5d72f6593c5e194af6c94520653025805ff94b9cd829cd2d44e263349eb9896ebd3c2982059d1b2772850863ab3')

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

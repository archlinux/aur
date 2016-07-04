# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=('python-wcwidth' 'python2-wcwidth')
pkgver=0.1.7
pkgrel=1
pkgdesc="Measures number of Terminal column cells of wide-character codes"
url="https://github.com/jquast/wcwidth"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-${pkgver}.tar.gz")
sha512sums=('5bc9625fbd10721a50a3ac7d7f91012cca8e4f83533f265cf56890498bc52a53b155c82e67d6bc5523a5593c8d7992a1dec2a0f590318170eddf987c56f9c368')

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

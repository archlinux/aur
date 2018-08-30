# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=python-pyjwkest
pkgname=($pkgbase 'python2-pyjwkest')
pkgver=1.4.0
pkgrel=1
pkgdesc='Implementation of JWT, JWS, JWE and JWK.'
arch=('any')
url='https://github.com/rohe/pyjwkest'
license=('Apache')
makedepends=('python-setuptools' 'python-pycryptodomex' 'python-requests' 'python-six' 'python-future'
             'python2-setuptools' 'python2-pycryptodomex' 'python2-requests' 'python2-six' 'python2-future')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('da7c2a0fa21bde050525a50b4b6ae7b265fc2319d598e44e84a4430961bed420')

prepare() {
    cp -r pyjwkest-$pkgver pyjwkest-$pkgver-python2
}

build() {

    cd ${srcdir}/pyjwkest-${pkgver}
    python setup.py build

    cd ${srcdir}/pyjwkest-${pkgver}-python2
    python2 setup.py build

}

package_python-pyjwkest() {

    depends=('python-setuptools' 'python-pycryptodomex' 'python-requests' 'python-six' 'python-future')

    cd pyjwkest-$pkgver
    python setup.py install --root $pkgdir

}

package_python2-pyjwkest() {

    depends=('python2-setuptools' 'python2-pycryptodomex' 'python2-requests' 'python2-six' 'python2-future')

    cd pyjwkest-$pkgver-python2
    python2 setup.py install --root $pkgdir

}

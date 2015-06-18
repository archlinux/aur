# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgbase=python-stopit
pkgname=('python-stopit' 'python2-stopit')
_pyname=stopit
pkgver=1.1.1
pkgrel=1
pkgdesc="Library to raise asynchronous exceptions in other thread, control the timeout of blocks or callables"
url="https://github.com/glenfant/stopit"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/glenfant/${_pyname}/archive/${pkgver}.tar.gz)
sha512sums=('afa6e315908c05a72c8d483b79091945671dd7f66e44a5b98afdf9d0e81eabc6d776d57c9d52b6eb588345f1337e2622ecc4c65aed31379ad80be778fd9a7bfb')

check() {
  cd ${_pyname}-${pkgver}
  python setup.py test
  python2 setup.py test
}

package_python-stopit() {
  depends=('python')

  cd ${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

package_python2-stopit() {
  depends=('python2')

  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:

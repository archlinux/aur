# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: yochananmarqos
pkgname=python-fbs
_name=fbs
pkgver=1.1.8
pkgrel=1
pkgdesc="Python and Qt-based lightweight alternative to Electron"
arch=('any')
url="https://build-system.fman.io/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-pyqt5: Qt5 Python bindings'
            'pyside2: PySide Qt5 Python bindings'
            'python-sentry_sdk: upload errors that occur in your app to Sentry'
            'python-boto3: AWS support')
source=("${_name}-${pkgver}.tar.gz"::"https://github.com/mherrmann/fbs/archive/v${pkgver}.tar.gz")
sha256sums=('8e3a698079d5f516806716ca5257ea295c3be194f654a8545bab2837346aa94f')
sha512sums=('f9eb0da0ce9442f3534ac23b214f4df61a1e68749a14e4f5f1be6ac0a3306850c25b3a2d3f340b0c7a83d5284a8428903a0d35aaa2d3b6ee9d502373e5550605')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:

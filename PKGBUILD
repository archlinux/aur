# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: yochananmarqos
pkgname=python-fbs
_name=fbs
pkgver=1.0.1
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
sha256sums=('8d14dadd7e34db091692baacba58fef5d63a85c38e1b9f3083e556bbcb3ccd89')
sha512sums=('2f71ffb7283642c5477520a38d79078afdbf6f9d5dac13502431f3856161f2df831564f4b51d308d1ccd66d1e82b406c51648c87959fe2d7c0ad260c1f1e46c2')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:

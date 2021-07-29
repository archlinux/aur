# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: yochananmarqos
pkgname=python-fbs
_name=fbs
pkgver=0.9.8
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
sha256sums=('a52daa08a7952b00bcd264a4963085a05892466cb3d8ad5eb873589b8f412526')
sha512sums=('c8567210825a2f4d072e991a77c491ef7913ae4e859340730a75b8acdca54d27c0a759c06d428b4ca77899429f99c72be6c8685a09781acb22d4261b5ac456e2')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:

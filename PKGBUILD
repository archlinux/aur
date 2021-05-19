# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: yochananmarqos
pkgname=python-fbs
_name=fbs
pkgver=0.9.4
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
sha256sums=('2ac43c838a79d44db2af603c1f3ca4dc5613688dd7a732a6dc18f178915e23ea')
sha512sums=('b587b4a7a812b9833177b2ee69b0d85843c10b9319bd729239a00bcb4660d0bfccae112d8145a29894b6f4f4e0ba523a390977f2908863fcfe35377dda2756b0')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:

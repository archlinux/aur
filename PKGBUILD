# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: yochananmarqos

pkgname=python-fbs
_name=fbs
pkgver=1.2.1
pkgrel=1
pkgdesc="Python and Qt-based lightweight alternative to Electron"
arch=('any')
url="https://build-system.fman.io/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools'
  python-{build,installer,wheel})
optdepends=('python-pyqt5: Qt5 Python bindings'
  'pyside2: PySide Qt5 Python bindings'
  'python-sentry_sdk: upload errors that occur in your app to Sentry'
  'python-boto3: AWS support')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4ef587106d6b7cf515767d8f8ec3f5b241cbf8dad3fb49c78c5a7cde714f6a77')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:

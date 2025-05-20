# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-protocol
pkgname=python-${_name}
pkgver=1.0.3
pkgrel=1
pkgdesc='Python protocol stubs for LiveKit.'
arch=('any')
url='https://github.com/livekit/python-sdks/tree/main/livekit-protocol'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('61d5c902237903e235589e0d34c90b0bf4b5f870e8ffde2a8a81cc942d967894')
depends=('python' 'python-protobuf')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-protocol
pkgname=python-${_name}
pkgver=0.8.0
pkgrel=1
pkgdesc='LiveKit real-time and server SDKs for Python.'
arch=('any')
url='https://github.com/livekit/python-sdks'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('07ce9f6a672988c7ea2eac245fee7dd64b2d4a113576db6daac92363f647c685')
depends=('python>=3.7' 'python-protobuf' 'python-types-protobuf' 'python-gobject')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

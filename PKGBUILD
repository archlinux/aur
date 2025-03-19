# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-protocol
pkgname=python-${_name}
pkgver=0.9.2
pkgrel=1
pkgdesc='Python protocol stubs for LiveKit.'
arch=('any')
url='https://github.com/livekit/python-sdks/tree/main/livekit-protocol'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('d1f7a6f993de920f275559b63533578142c4c87c76b27f09151008b661c16760')
depends=('python>=3.7' 'python-protobuf' 'python-types-protobuf')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

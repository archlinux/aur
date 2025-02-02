# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pyht
pkgname=python-${_name}
pkgver=0.1.12
pkgrel=1
pkgdesc=" PlayHT Python SDK - AI Text-to-Speech Streaming & Voice Cloning API."
arch=('any')
url='https://github.com/playht/pyht'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('2ee9f63adf0149953ad9c344e2f0720c1807e8871107b5f9be53ef18e0bf4181')
depends=('python>=3.8' 'python-grpcio' 'python-filelock' 'python-protobuf' 'python-requests' 'python-aiohttp' 'python-websockets')
makedepends=('python-poetry-core' 'python-poetry-dynamic-versioning' 'python-grpcio-tools')
optdepends=('python-sphinx: docs' 'python-sphinx_rtd_theme: docs' 'python-gitpython: docs' 'python-sphinx-copybutton: docs')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

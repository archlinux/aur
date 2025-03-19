# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-agents
pkgname=python-${_name}
pkgver=0.12.17
pkgrel=1
pkgdesc='LiveKit Python Agents.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-agents'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('8f1f111930982d9e36d69fc80d3c050a7eb32b88ed20b56cd8831de5b6fe1219')
depends=('python>=3.9' 'python-click' 'python-livekit' 'python-livekit-api' 'python-livekit-protocol' 'python-protobuf' 'python-pyjwt' 'python-types-protobuf' 'python-watchfiles' 'python-psutil' 'python-aiohttp' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-av: codecs' 'python-numpy: codecs' 'python-pillow: images')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

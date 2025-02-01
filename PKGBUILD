# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-agents
pkgname=python-${_name}
pkgver=0.12.11
pkgrel=3
pkgdesc='The core LiveKit Agents Framework.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-agents'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('5fa328686068f2e08fee3ea9f1237ea5985151d79996d62e76134a7a5ec7a8a5')
depends=('python>=3.7' 'python-click' 'python-livekit' 'python-livekit-api' 'python-livekit-protocol' 'python-protobuf' 'python-pyjwt' 'python-types-protobuf' 'python-watchfiles' 'python-psutil' 'python-aiohttp' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('python-av: codecs' 'python-numpy: codecs' 'python-pillow: images')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

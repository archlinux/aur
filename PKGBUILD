# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-elevenlabs
pkgname=python-${_name}
pkgver=0.8.1
pkgrel=1
pkgdesc='Agent Framework plugin for voice synthesis with ElevenLabs API.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-elevenlabs'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('49bddd5054abcf4c1253c14de1602b9cf3cefa80bf4f16ae8a00993f700448e6')
depends=('python>=3.9' 'python-livekit-agents' 'python-av' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

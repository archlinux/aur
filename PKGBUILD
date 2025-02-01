# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-elevenlabs
pkgname=python-${_name}
pkgver=0.7.12
pkgrel=2
pkgdesc='Agent Framework plugin for voice synthesis with ElevenLabs API.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-elevenlabs'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('dbc954ca458a044ef4d6b0ce31963dbd621b55e49b8502da3fc895c81bf9dd85')
depends=('python>=3.9' 'python-livekit-agents' 'python-av' 'python-numpy')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

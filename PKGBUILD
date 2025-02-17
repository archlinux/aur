# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-elevenlabs
pkgname=python-${_name}
pkgver=0.7.13
pkgrel=1
pkgdesc='Agent Framework plugin for voice synthesis with ElevenLabs API.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-elevenlabs'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('418d8546c32e4436e2fc3993a48ed429f713ff8f42306c84c98b8b42fa20c827')
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

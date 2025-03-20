# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-turn-detector
pkgname=python-${_name}
pkgver=0.4.3
pkgrel=1
pkgdesc='End of utterance detection for LiveKit Agents.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-turn-detector'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('0069f0aa236a4968aa1597c796f627582a8d2aca7ef3fbb56c0aeecbefceccd1')
depends=('python>=3.9' 'python-livekit-agents' 'python-transformers' 'python-numpy' 'python-onnxruntime' 'python-jinja')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

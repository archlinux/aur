# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-turn-detector
pkgname=python-${_name}
pkgver=0.4.1
pkgrel=1
pkgdesc='End of utterance detection for LiveKit Agents.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-turn-detector'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('07cdf877396df76d6cc7fe05fa617b8bd27c84eba940d3e36392adb61394248e')
depends=('python>=3.9' 'python-livekit-agents' 'python-transformers' 'python-numpy' 'python-onnxruntime' 'python-jinja')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

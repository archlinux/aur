# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-turn-detector
pkgname=python-${_name}
pkgver=0.4.0
pkgrel=1
pkgdesc='This plugin introduces end-of-turn detection for LiveKit Agents using a custom open-weight model to determine when a user has finished speaking.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/${_name}'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('3545d3402acdda00b447ccdd73dd7ef7fb94b413aeedb760d1aeb29bc8e8adf5')
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

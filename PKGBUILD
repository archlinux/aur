# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-deepgram
pkgname=python-${_name}
pkgver=0.7.1
pkgrel=1
pkgdesc="Agent Framework plugin for speech-to-text with DeepGram's API."
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-deepgram'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('ce20d71e5e2a1035f4fed9cc1fd44db4b3ed1aad20b38bc5351f3e637779f5a4')
depends=('python>=3.9' 'python-livekit-agents' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

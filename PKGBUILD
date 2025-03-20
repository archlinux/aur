# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-nltk
pkgname=python-${_name}
pkgver=0.7.4
pkgrel=1
pkgdesc='Agent Framework plugin for NLTK-based text processing.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-nltk'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('8bc11520e8d9c0fea2cff2bd12fed177da5c0d5efd32b1383ef9816a43d2dd1e')
depends=('python>=3.9' 'python-livekit-agents' 'python-nltk')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

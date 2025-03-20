# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-rag
pkgname=python-${_name}
pkgver=0.2.4
pkgrel=1
pkgdesc='Agent Framework plugin for RAG utilities.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-rag'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('6a627b49d616494f16b3d3a0d36d9f99b09ccaf0f4f24b42a11dbcbdcfdf1f10')
depends=('python>=3.9' 'python-livekit-agents' 'python-annoy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

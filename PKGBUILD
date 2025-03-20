# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-openai
pkgname=python-${_name}
pkgver=0.11.3
pkgrel=1
pkgdesc='Agent Framework plugin for services from OpenAI.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-openai'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('a189cd59cd23525930c0e465f5bd3e822dcb3aabcf56eb9024127ac2319b6b71')
depends=('python>=3.9' 'python-livekit-agents' 'python-av' 'python-numpy' 'python-pillow' 'python-openai')
optdepends=('python-google-auth: vertex')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

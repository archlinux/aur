# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-azure
pkgname=python-${_name}
pkgver=0.5.6
pkgrel=1
pkgdesc='Agent Framework plugin for services from Azure Cognitive Services.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-azure'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('f295d8062b0dd70cb8400b8fb6bf9559bc535358c17e0a162ce19bee75a5a33e')
depends=('python>=3.9' 'python-livekit-agents' 'python-azure-cognitiveservices-speech')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

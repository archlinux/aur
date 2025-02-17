# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-azure
pkgname=python-${_name}
pkgver=0.5.3
pkgrel=2
pkgdesc='Agent Framework plugin for services from Azure Cognitive Services.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-azure'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('7a4428b0db86ec5d75a61d95af1c67d0e3155ec5ea2609c50a4eaee0722f78fb')
depends=('python>=3.9' 'python-livekit-agents' 'python-azure-cognitiveservices-speech')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

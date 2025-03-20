# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-google
pkgname=python-${_name}
pkgver=0.11.1
pkgrel=1
pkgdesc="Agent Framework plugin for services from Google Cloud."
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-google'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('04d11d343c388b06a4dc38985d61f31ff9b2bd4d954d5136ac0516305930bdfb')
depends=('python>=3.9' 'python-google-auth' 'python-google-cloud-speech' 'python-google-cloud-texttospeech' 'python-google-genai' 'python-livekit-agents')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

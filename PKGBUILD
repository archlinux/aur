# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-google
pkgname=python-${_name}
pkgver=0.10.2
pkgrel=1
pkgdesc="Agent Framework plugin for services from Google Cloud."
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-google'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('22e4ffe9926fdc12e2ff7e53ba34e5c6709569dff28c85ddcf8898339d7d7d5c')
depends=('python>=3.9' 'python-google-auth' 'python-google-cloud-speech' 'python-google-cloud-texttospeech' 'python-google-genai' 'python-livekit-agents')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

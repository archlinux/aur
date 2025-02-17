# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-google
pkgname=python-${_name}
pkgver=0.10.4
pkgrel=1
pkgdesc="Agent Framework plugin for services from Google Cloud."
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-google'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('846cfd6f5e42777cc1e4d8074da7a0b62053734d7b1a0dd983e904599e7a4b63')
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

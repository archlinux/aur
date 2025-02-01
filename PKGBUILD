# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-openai
pkgname=python-${_name}
pkgver=0.10.17
pkgrel=2
pkgdesc='Agent Framework plugin for services from OpenAI.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-openai'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('9f9a00d4afd852e569628d1938ff5d9749e94f6f892ecd1a14d793f29a1ea98f')
depends=('python>=3.9' 'python-livekit-agents' 'python-av' 'python-numpy' 'python-pillow' 'python-openai')
optdepends=('python-google-auth: vertex')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

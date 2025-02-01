# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-llama-index
pkgname=python-${_name}
pkgver=0.2.2
pkgrel=1
pkgdesc='Agent Framework plugin for using Llama Index.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('c6dfa21fc576ffb3421d166a76b9bdf82a417c6d2caa2814527bb6d582d49836')
depends=('python>=3.9' 'python-livekit-agents')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

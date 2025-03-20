# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-playai
pkgname=python-${_name}
pkgver=1.0.9
pkgrel=1
pkgdesc='Agent Framework plugin for voice synthesis with PlayAI API.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-playai'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('3bc5dc701b156b8476fcc527b41c3c0dd63decc05effdda512338ac0ab667471')
depends=('python>=3.9' 'python-livekit-agents' 'python-av' 'python-numpy' 'python-pyht' 'python-aiohttp' 'python-livekit')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

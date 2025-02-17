# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-playai
pkgname=python-${_name}
pkgver=1.0.7
pkgrel=2
pkgdesc='Agent Framework plugin for voice synthesis with PlayAI API.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-playai'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('0c1ea168bfc8827fe5818f7ea27889e3778b916430f8224721d47ec503efad9a')
depends=('python>=3.9' 'python-livekit-agents' 'python-av' 'python-numpy' 'python-pyht' 'python-aiohttp' 'python-livekit')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

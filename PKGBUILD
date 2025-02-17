# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-minimal
pkgname=python-${_name}
pkgver=0.2.1
pkgrel=3
pkgdesc='This is a minimal example of a LiveKit plugin for Agents.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-minimal'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('13e04dc960829cb2c9a4c63a1fcb1485dacaf700596b1f1e30dc24ae797a5b31')
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

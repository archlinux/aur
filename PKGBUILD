# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-fal
pkgname=python-${_name}
pkgver=0.2.4
pkgrel=1
pkgdesc='This plugin provides a simple way to integrate fal.ai models into the LiveKit Agent Framework.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-fal'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('88b560968f1dfa4d8e90c7d2ec168ed980ca2f1ecf3d437c0197a935f65d5609')
depends=('python>=3.9' 'python-livekit-agents' 'python-fal-client')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-clova
pkgname=python-${_name}
pkgver=1.0.0.dev5
pkgrel=1
pkgdesc="Agent Framework plugin for speech-to-text with Clova's API."
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-clova'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('562743220b585e8336ffe2d2eb8468b907397c28bcd3429ad1209c06ed5d5965')
depends=('python>=3.9' 'python-livekit-agents' 'python-pydub')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

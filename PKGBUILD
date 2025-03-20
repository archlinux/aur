# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-rime
pkgname=python-${_name}
pkgver=0.2.2
pkgrel=1
pkgdesc='Agent Framework plugin for voice synthesis with the Rime API.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-rime'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('81e1a985830af76dd2a3eb8de24daf1fc6736a9793a710105d9c7f91a8dae7af')
depends=('python>=3.9' 'python-livekit-agents' 'python-av' 'python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

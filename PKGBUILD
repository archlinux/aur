# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-neuphonic
pkgname=python-${_name}
pkgver=0.1.1
pkgrel=1
pkgdesc='Agent Framework plugin for voice synthesis with Neuphonic API.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-neuphonic'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('60816bab050fbb2a38373d62f3e6072c8f60f951933d052d71c6e9d7fecfadf8')
depends=('python>=3.9' 'python-livekit-agents')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

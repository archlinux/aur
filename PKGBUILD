# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-silero
pkgname=python-${_name}
pkgver=0.7.4
pkgrel=3
pkgdesc='Agent Framework Plugin for Silero.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-silero'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('f399a14a99bacd6e284ca7a2a12273cc8050e362ebecda2d4942055607b22cef')
depends=('python>=3.9' 'python-livekit-agents' 'python-onnxruntime' 'python-numpy')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-fal
pkgname=python-${_name}
pkgver=0.2.3
pkgrel=3
pkgdesc='This plugin provides a simple way to integrate fal.ai models into the LiveKit Agent Framework.'
arch=('x86_64' 'aarch64')
url='https://github.com/livekit/agents/tree/main/livekit-plugins/livekit-plugins-fal'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('13d423a5af38034dd70b68c163a4eaa6fdcb2f381f6faefdd75e0bd56804623d')
depends=('python>=3.9' 'python-livekit-agents' 'python-fal-client')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

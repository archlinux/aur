# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-cartesia
pkgname=python-${_name}
pkgver=0.4.7
pkgrel=1
pkgdesc='Build real-time multimodal AI applications'
arch=('any')
url='https://github.com/livekit/agents'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('dfa09539577d31c3b9aba2e425dffa134fe70d928a42e06b7410a8f8b557e3e2')
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

# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-anthropic
pkgname=python-${_name}
pkgver=0.2.9
pkgrel=1
pkgdesc='Build real-time multimodal AI applications'
arch=('any')
url='https://github.com/livekit/agents'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('79a17e744d3fb5f79caa0263238d67959d2108c5790210780bd6ae053b3381e0')
depends=('python>=3.9' 'python-livekit-agents' 'python-anthropic')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-plugins-deepgram
pkgname=python-${_name}
pkgver=0.6.17
pkgrel=1
pkgdesc='Build real-time multimodal AI applications'
arch=('any')
url='https://github.com/livekit/agents'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('8d78abd5dd5c6ce0144d2fe9fcaf4ddc49e082e13aed1e76aeceb8be142234c7')
depends=('python>=3.9' 'python-livekit-agents' 'python-numpy')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='psygnal'
_author='tlambert03'
pkgname="python-${_name}"
pkgver=0.2.0
pkgrel=1
pkgdesc='Pure python implementation of Qt Signals.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-setuptools-scm'
)
depends=(
  'python'
  'python-typing_extensions'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7339e6bb8784bc10330625239996b200e15ce38d78f67713bdb19479f97d2153')
provides=("python-${_name}")

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:<Paste>

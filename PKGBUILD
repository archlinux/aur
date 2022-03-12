# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='psygnal'
_author='tlambert03'
pkgname="python-${_name}"
pkgver=0.3.3
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
sha256sums=('dda19ce8c3b81145ac36d0a5810c52b1c7a1b6fd1745e9a3a6d48499a6213598')
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

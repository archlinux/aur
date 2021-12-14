# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari-console'
_author='napari'
pkgname="${_name}"
pkgver=0.0.4
pkgrel=1
pkgdesc='A plugin that adds a console to napari.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-setuptools-scm'
)
depends=(
  'python'
  'python-ipykernel'
  'ipython'
  'python-qtconsole'
  'python-qtpy'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ea0e30fbfdd76542adda44be457f1306a65146fe7578f95838e28d62874f4c45')
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

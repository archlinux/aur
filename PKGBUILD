# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari-svg'
_author='napari'
pkgname="${_name}"
pkgver=0.1.5
pkgrel=1
pkgdesc='A plugin for writing svg files from napari.'
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('BSD')
makedepends=(
  'python-setuptools-scm'
)
depends=(
  'python'
  'python-imageio'
  'python-napari-plugin-engine'
  'python-numpy'
  'python-vispy'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7b0c9dfb66d63a251f550c074e1b11d177aaea7a61dd19fcdaed87739c441bfd')
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

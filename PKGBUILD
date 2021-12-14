# Maintainer: Lorenzo Gaifas <brisvag at gmail dot com>

_name='napari'
_author='napari'
pkgname="${_name}"
pkgver=0.4.12
pkgrel=1
pkgdesc='Multi-dimensional image viewer for Python.'
arch=('any')
url='https://napari.org'
license=('BSD')
makedepends=(
  'python-setuptools-scm'
)
depends=(
  'python'
  'python-importlib-metadata'
  'python-appdirs'
  'python-cachey'
  'python-dask'
  'python-imageio'
  'python-importlib-metadata'
  'python-jsonschema'
  'python-magicgui'
  'python-napari-console'
  'python-napari-svg'
  'python-napari-plugin-engine'
  'python-numpy'
  'python-numpydoc'
  'python-pandas'
  'python-pillow'
  'python-pint'
  'python-psutil'
  'python-opengl-accelerate'
  'python-pyaml'
  'python-pydantic'
  'python-qtpy'
  'python-scipy'
  'python-superqt'
  'python-tifffile'
  'python-typing_extensions'
  'python-toolz'
  'python-tqdm'
  'python-vispy'
  'python-wrapt'
  'qt5-python-bindings'
)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6cb7c09b53b3ad921fc1609a672c76dca0b11106cb440922457660c5e6eb6020')
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

# Maintainer: jerry73204 <jerry73204 at google gmail>
# Previous maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-datashader'
pkgname='python-datashader'
pkgver=0.11.0
pkgrel=1
pkgdesc='Bin-based rendering toolchain to visualize large datasets.'
arch=('any')
url='https://github.com/bokeh/datashader'
license=('BSD')
makedepends=('python-setuptools' 
             'python-param'
             'python-pyct')
groups=('bokeh-ecosystem')
depends=(
  'python>=3.4'
  'python-dask>=0.18.0'
  'python-datashape>=0.5.1'
  'python-numba>=0.37.0'
  'python-numpy>=1.7'
  'python-pandas>=0.24.1'
  'python-pillow>=3.1.1'
  'python-toolz>=0.7.4'
  'python-xarray>=0.9.6'
  'python-colorcet>=0.9.0'
  'python-param>=1.6.0'
  'python-pyct'
  'python-bokeh'
  'python-scipy'
)
source=("https://github.com/pyviz/datashader/archive/v${pkgver}.tar.gz")
sha256sums=('27c1bf758eb7c57c17fcb15da93c108b382d522472f464ab8565c8f51e9707be')

build() {
  cd "${srcdir}/datashader-${pkgver}"
  python setup.py build
}

package_python-datashader() {
  cd "${srcdir}"/datashader-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}

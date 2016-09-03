# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-datashader'
pkgname='python-datashader'
pkgver=0.4.0
pkgrel=1
pkgdesc='Bin-based rendering toolchain to visualize large datasets.'
arch=('any')
url='https://github.com/bokeh/datashader'
license=('BSD')
makedepends=('python-setuptools')
groups=('bokeh-ecosystem')
depends=('python-dask'
         'python>=3.4'
         'python-datashape>=0.5.1'
         'python-numba>=0.24.0'
         'python-numpy>=1.7'
         'python-odo>=0.4.1'
         'python-pandas>=0.15.0'
         'python-pillow'
         'python-toolz'
         'python-xarray')
source=("https://github.com/bokeh/datashader/archive/${pkgver}.tar.gz")
sha1sums=('af1858a6f41e09900e6b590d77315333593be766')
md5sums=('7791d7f1e1241ab417996e29004bc75f')

build() {
  cd "${srcdir}"/datashader-$pkgver
  python setup.py build
}

package_python-datashader() {
  cd "${srcdir}"/datashader-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}

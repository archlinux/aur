# Maintainer: jerry73204 <jerry73204 at google gmail>
# Previous maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-datashader'
pkgname='python-datashader'
pkgver=0.7.0
pkgrel=1
pkgdesc='Bin-based rendering toolchain to visualize large datasets.'
arch=('any')
url='https://github.com/bokeh/datashader'
license=('BSD')
makedepends=('python-setuptools' 
             'python-param'
             'python-pyct')
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
source=("https://github.com/pyviz/datashader/archive/v${pkgver}.tar.gz")
sha256sums=('bc94506303a13736acee0ebbd1d30cc61bccf99b59f0316c179908ae9523e3cd')

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

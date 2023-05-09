# Maintainer: Bernardo Gameiro <projects@bgameiro.me>

extension='xarray'
pkgbase='python-intake-xarray'
pkgname=('python-intake-xarray')
pkgver=0.6.1
pkgrel=1
pkgdesc='$extension extension for intake'
arch=('any')
url='https://intake-xarray.readthedocs.io'
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/i/intake-xarray/intake-xarray-$pkgver.tar.gz")
sha256sums=('63dc2a8b937d8f956255d8f8641f08ea654b2d9e88687ec3d1ccc66462fabf9e')
provides=("$pkgbase=$pkgver")

build() {
  cd "${srcdir}"/intake-$extension-$pkgver
  python setup.py build
} 

package_python-intake-xarray() {
  depends=(
         'python>=3.8.0'
         'python-intake>=0.6.6'
         'python-dask'
	       'python-jinja'
         'python-msgpack'
         'python-requests'
         'python-xarray>=2022.01.0'
         'python-zarr'
         'python-netcdf4')

  cd "${srcdir}"/intake-$extension-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-blaze'
pkgname='python-blaze'
pkgver=0.11.0
pkgrel=1
pkgdesc='numpy and pandas interface to large datasets'
arch=('any')
url='https://github.com/blaze/blaze.git'
license=('BSD')
makedepends=('python-setuptools')
groups=('blaze-ecosystem')
depends=('python>=3.4'
         'python-numpy>=1.7'
         'python-pandas>=0.15.0'
         'python-datashape'
         'python-odo'
         'python-toolz'
         'python-multipledispatch>=0.4.7'
         'python-sqlalchemy>=0.8.0'
         'python-psutil'
         'python-numpydoc'
         'python-dask'
         'python-flask>=0.10.1'
         'python-flask-cors')
optdepends=('python-pymongo: MongoDB support'
            'python-h5py: HDF5 support'
            'python-py4j: Spark support')
source=("https://github.com/blaze/blaze/archive/${pkgver}.tar.gz")
sha1sums=('32fe7ea987247006dcbb3c45a15bda54e87eccbf')
md5sums=('1ad77782e2c37130a3b77ec357dccb85')

build() {
  cd "${srcdir}"/blaze-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/blaze-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

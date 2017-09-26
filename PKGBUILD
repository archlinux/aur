# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-dask
_pkgname=dask
pkgver=0.15.3
pkgrel=1
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://github.com/dask/dask"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-pandas' 'python-toolz' 'python-cloudpickle' 'python-partd>=0.3.8' )
checkdepends=('ipython' 'python-bcolz' 'python-cachey' 'python-graphviz' 'python-sparse' 'python-pytest')
optdepends=('python-bcolz'
  'python-bokeh'
  'python-cachey'
  'python-cityhash: faster hashing'
  'python-fastparquet: Parquet support'
  'python-graphviz'
  'python-psutil'
  'python-sparse: sparse data support'
  'python-s3fs: S3 support')
makedepends=('python-setuptools')
source=("https://github.com/dask/dask/archive/$pkgver.tar.gz")
sha256sums=('fda2f293f7bac1d699d47313244fd01ca21a5378fc3a434a356f20739093aef0')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  py.test dask/tests
}
# vim:ts=2:sw=2:et:

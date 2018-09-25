# Maintainer: Amos Onn <amosonn at gmail dot com>
pkgname=python-distributed
pkgver=1.23.2
pkgrel=1
pkgdesc="A python library for distributed computation."
arch=('any')
url="http://distributed.readthedocs.org/en/stable/"
license=('BSD-3-clause')
depends=('python>=3.5' 'python-tornado>=4.5.1' 'python-toolz>=0.7.4'
    'python-cloudpickle>=0.2.2' 'python-dask>=0.18.0' 'python-click>=6.6'
    'python-psutil' 'python-zict>=0.1.3' 'python-sortedcontainers' 'python-six'
    'python-tblib' 'python-msgpack' 'python-yaml')
# For supporting other versions of python:
# futures; python_version < '3.0'
# singledispatch; python_version < '3.4'
optdepends=(
    # dev-requirements.txt
    'python-joblib>=0.10.2' 'python-mock>=2.0.0' 'python-pandas>=0.19.2'
    'python-numpy>=1.11.0' 'python-bokeh>=0.12.3' 'python-requests>=2.12.4'
    'python-pyzmq>=16.0.2' 'ipython>=5.0.0' 'python-jupyter_client>=4.4.0'
    'python-ipykernel>=4.5.2' 'python-pytest>=3.0.5'
    # pytest.importorskip
    'python-keras' 'python-lz4' 'python-netcdf4' 'python-h5py' 'python-paramiko'
    'python-ipywidgets' # crick, hdfs-3
)
source=(https://codeload.github.com/dask/distributed/tar.gz/$pkgver)
sha256sums=('2190a73b0a248aadf14119b111ca5d46c671a85d31088a56249cb103b9d2a721')

package() {
  cd $srcdir/distributed-$pkgver
  python setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}

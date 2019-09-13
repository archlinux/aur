# Maintainer: Amos Onn <amosonn at gmail dot com>
pkgname=python-distributed
_pkgname=distributed
pkgver=2.4.0
pkgrel=1
pkgdesc="A python library for distributed computation."
arch=('any')
depends=('python>=3.5' 'python-click>=6.6' 'python-cloudpickle>=0.2.2' 
'python-dask>=2' 'python-msgpack' 'python-psutil>=5.0'
'python-sortedcontainers>2.0.1' 'python-tblib' 'python-toolz>=0.7.4'
'python-tornado>=5' 'python-zict>=0.1.3' 'python-yaml')
optdepends=(
# dev-requirements.txt
'python-joblib>=0.10.2' 'python-pandas>=0.19.2' 'python-numpy>=1.11.0'
'python-bokeh>=0.12.3' 'python-requests>=2.12.4' 'python-pyzmq>=16.0.2'
'ipython>=5.0.0' 'python-jupyter_client>=4.4.0' 'python-ipykernel>=4.5.2'
'python-pytest>=3.0.5' 'python-prometheus_client>=0.6.0'
'python-jupyter-server-proxy>=1.1.0'
# pytest.importorskip
'python-keras' 'python-lz4' 'python-netcdf4' 'python-h5py'
'python-paramiko' 'python-ipywidgets' # crick, hdfs-3
)
url="http://distributed.readthedocs.org/en/stable/"
license=('BSD-3-clause')
source=(https://codeload.github.com/dask/distributed/tar.gz/$pkgver)
sha256sums=('2e1e37713df8dd89aac644d0cbac0aa73aead6d91cd7b6f5a55706f32789c051')

package() {
  cd $srcdir/$_pkgname-$pkgver
  python setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}

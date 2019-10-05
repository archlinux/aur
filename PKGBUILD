# Maintainer: Amos Onn <amosonn at gmail dot com>
# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>

pkgname=python-distributed
_pkgname=distributed
pkgver=2.5.2
pkgrel=1
pkgdesc="Python library for distributed computing"
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
license=('BSD')
source=("$pkgver.tar.gz::https://codeload.github.com/dask/distributed/tar.gz/$pkgver")
sha256sums=('4701f1ca503786a71dcf8a2cb29d91ca97c255f092c622b4e2d68b2e60ad1d8a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 || return 1
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
}

pkgname=python-distributed
pkgver=1.9.1
pkgrel=1
pkgdesc="A python library for distributed computation."
arch=('any')
url="http://distributed.readthedocs.org/en/stable/"
license=('Other')
depends=('python>=3.5' 'python-tornado' 'python-toolz' 'python-cloudpickle'
         'python-dask' 'python-click' 'python-locket' 'python-boto3'
         'python-six' 'python-tblib' 'python-msgpack')
optdepends=('python-paramiko' 'python-pandas' 'python-ipywidgets')
source=(https://github.com/dask/distributed/archive/$pkgver.tar.gz)
sha256sums=('270189d60f35547cf6c0366871989e5ecd3f585f73af4aac07925d8a43385dce')

package() {
  cd $srcdir/distributed-$pkgver
  python setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/COPYING
}

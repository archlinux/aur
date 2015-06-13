pkgname=python2-scoop
pkgver=0.7.1
pkgrel=1
pkgdesc="Scalable Concurrent Operations in Python, is a distributed task \
module allowing concurrent parallel programming on various environments, \
from heterogeneous grids to supercomputers."
arch=('any')
url="https://scoop.googlecode.com"
license=('LGPL')
depends=('python2' 'python2-setuptools' 'python2-greenlet' 'python2-pyzmq' 'openssh')
source=("https://pypi.python.org/packages/source/s/scoop/scoop-$pkgver.release.tar.gz")
md5sums=('56cd1e949f7677848c9fc43aeb3eb28a')

package() {
  cd "$srcdir/scoop-$pkgver.release"
  find . -name '*.py' -exec sed -i -e '1 s/python\s*$/python2/' {} \;
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

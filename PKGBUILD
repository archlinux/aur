# Maintainer: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>


pkgname=python-cassandra-driver-git
pkgdesc="DataStax Python Driver for Apache Cassandra"
pkgver=3.17.0
provides=('python-cassandra-driver')
pkgrel=2
arch=('any')
license=('Apache')
depends=('python' 'python-six')
makedepends=('python-setuptools' 'libev')
url="https://github.com/datastax/python-driver"
source=("git+https://github.com/datastax/python-driver#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/python-driver"
  CASS_DRIVER_BUILD_CONCURRENCY=$(nproc) python setup.py build
}

package() {
  cd "$srcdir/python-driver"
  python setup.py install --prefix=/usr --root="$pkgdir"
} 

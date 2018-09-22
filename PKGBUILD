# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-ichororm'
pkgver=2.0.2
pkgrel=2
pkgdesc="ichorORM - A python library for postgresql focused on performance and supporting ORM and query-building functionality"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/ichorORM"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python' 'python-psycopg2')

source=("https://github.com/kata198/ichorORM/archive/${pkgver}.tar.gz")
sha512sums=("fe2520d63bb4aece522adbeb32fde377b8d106aeea9229db534e9f71f401529ca2c3d5633a9600928a3c0ed76d4417a1c4f622ae496901c48369f8a3fc33a1d0")

build() {
  cd "$srcdir"/ichorORM-$pkgver
  python setup.py build

}

package() {
  cd ichorORM-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}




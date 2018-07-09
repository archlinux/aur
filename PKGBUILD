# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python2-ichororm'
pkgver=2.0.2
pkgrel=1
pkgdesc="ichorORM - A python library for postgresql focused on performance and supporting ORM and query-building functionality"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/ichorORM"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2' 'python2-psycopg2')

source=("https://github.com/kata198/ichorORM/archive/${pkgver}.tar.gz")
sha512sums=("fe2520d63bb4aece522adbeb32fde377b8d106aeea9229db534e9f71f401529ca2c3d5633a9600928a3c0ed76d4417a1c4f622ae496901c48369f8a3fc33a1d0")

build() {
  cd "$srcdir"/ichorORM-$pkgver
  python2 setup.py build

}

package() {
  cd ichorORM-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}




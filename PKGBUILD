# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-ichororm'
pkgver=2.0.0
pkgrel=1
pkgdesc="ichorORM - A python library for postgresql focused on performance and supporting ORM and query-building functionality"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/ichorORM"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python' 'python-psycopg2')

source=("https://github.com/kata198/ichorORM/archive/${pkgver}.tar.gz")
sha512sums=("1ef6cc61abbfc4910de3ae5eb78826904938a0144d89de77c50bc634ae169acef52d1889112aa42981594dff6c93962fefbfbd6c421cf465598344f84068d236")

build() {
  cd "$srcdir"/ichorORM-$pkgver
  python setup.py build

}

package() {
  cd ichorORM-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}




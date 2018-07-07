# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-ichororm'
pkgver=2.0.1
pkgrel=1
pkgdesc="ichorORM - A python library for postgresql focused on performance and supporting ORM and query-building functionality"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/ichorORM"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python' 'python-psycopg2')

source=("https://github.com/kata198/ichorORM/archive/${pkgver}.tar.gz")
sha512sums=("2e850fc3e9e0ff327f7e2526d9308a57bac9a9ca771cc0341d1b54daebe1a27460020ff7196ff70edd3c20e602fccbeac5eb52427214e72c1557c06d1eae539c")

build() {
  cd "$srcdir"/ichorORM-$pkgver
  python setup.py build

}

package() {
  cd ichorORM-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}




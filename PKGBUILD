# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-aniso8601
pkgver=1.2.1
pkgrel=1
pkgdesc="A library for parsing ISO 8601 strings"
arch=('any')
depends=('python' 'python-dateutil')
makedepends=('python-setuptools')
url="https://bitbucket.org/nielsenb/aniso8601"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/61/f3/74a5a8affb192863f5f6aa3dfb0059a97442ff683d44fcc842b509758129/aniso8601-1.2.1.tar.gz)
md5sums=('e3990c8207f8baee045c29a0ad114fdb')
sha256sums=('e7ba4f42d3aea75909c79b1f4c4614768b4f13fbb98fc658a7b6061ddb0be47c')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}

# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-marshmallow
pkgver=2.7.3
pkgrel=1
pkgdesc="ORM/ODM/framework-agnostic library for converting complex datatypes, such as objects, to and from native Python datatypes"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python2-dateutil: robust datetime deserialization'
            'python2-simplejson: precision when (de)serializing Python decimal.Decimal types')
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/2b/b9/00d0e21bcabc30aeef422049908bcf369eaa70faab1309a197e8c1451689/marshmallow-2.7.3.tar.gz)
md5sums=('1f38a03f66978625270993dc1522bd63')
sha256sums=('3e71d5544860a5fc07cefb0b4e1f65924fdef877767042a1e957cc63a4765f1e')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

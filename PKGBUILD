# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-marshmallow
pkgver=2.1.1
pkgrel=1
pkgdesc="ORM/ODM/framework-agnostic library for converting complex datatypes, such as objects, to and from native Python datatypes"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-dateutil: robust datetime deserialization'
            'python-simplejson: precision when (de)serializing Python decimal.Decimal types')
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/m/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('841b653d4d66f795ca3a3a4e3493bde0')
sha256sums=('158ce9a9577b7550a8ed76245c5b22d9bde39fa7d5999f3333140949b7025ce5')

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

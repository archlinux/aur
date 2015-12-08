# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-marshmallow
pkgver=2.4.1
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
md5sums=('1b12f0808a925564ce17fa4e42b8cb22')
sha256sums=('706e9f482b9db3aa5f0d0b1452d914af6d5c281bbd4ab06542897d97860a8235')

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

# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-marshmallow
pkgver=2.9.0
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
source=(https://pypi.python.org/packages/3c/08/12d7d988c540184616bbb7c6635bbae6f7c558db84979bc7a9fdaa0a5f7c/marshmallow-2.9.0.tar.gz)
md5sums=('15ebc05a75de782116ab1d5eee807e73')
sha256sums=('4ef51025bfe84639f2dc42ea29c06fd6a487231b12d48a81ac9a24dbeb7b1b9f')

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

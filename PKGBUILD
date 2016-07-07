# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-marshmallow
pkgver=2.9.0
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
source=(https://pypi.python.org/packages/3c/08/12d7d988c540184616bbb7c6635bbae6f7c558db84979bc7a9fdaa0a5f7c/marshmallow-2.9.0.tar.gz)
md5sums=('15ebc05a75de782116ab1d5eee807e73')
sha256sums=('4ef51025bfe84639f2dc42ea29c06fd6a487231b12d48a81ac9a24dbeb7b1b9f')

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

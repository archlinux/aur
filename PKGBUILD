# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-marshmallow
pkgver=2.1.2
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
source=(https://pypi.python.org/packages/source/m/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('b6843a5aaffe057c6fdcb309fb9597fe')
sha256sums=('3c537701721164b7021d92d8cfff450ed5c1f7078c5ae3a8628bc78fece0f083')

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

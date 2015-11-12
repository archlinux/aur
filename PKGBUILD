# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-marshmallow
pkgver=2.2.1
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
md5sums=('75811e1e8c840867e7c142f6a866d2ba')
sha256sums=('141b96424a7bc15e5c39af0da9a596b6a5056c62c2135687c10c44cb1fcb7fcd')

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

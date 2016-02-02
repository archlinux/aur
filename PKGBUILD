# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-marshmallow
pkgver=2.6.0
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
md5sums=('fd876557367a94bbeb0790dd6d65ecab')
sha256sums=('acd5aa88c9089b2a44d30ddc30c24bfac6435a56ea1fb45923fcf367b037b363')

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

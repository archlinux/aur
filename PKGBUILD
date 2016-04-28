# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-marshmallow
pkgver=2.7.2
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
source=(https://pypi.python.org/packages/1c/1d/51ed9afd232691eaace459004cc5a6b7f7e177c0a7f2c1275d6f76e59f19/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('6b93167dba628314d66213cdf432af29')
sha256sums=('291f04d77332843e65dda06253174951c87d4b685ac0cea77415168fc6c76f71')

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

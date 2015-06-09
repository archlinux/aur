# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-marshmallow
pkgver=2.0.0b2
pkgrel=1
pkgdesc="A lightweight library for converting complex datatypes into native Python datatypes"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="http://marshmallow.rtfd.org"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/m/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('b958adde7fe431a43de1c38d63cf6993')
sha256sums=('c4bb1b8569bef322fea40658e523a47d559488e615f5db5789f520564851eb46')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

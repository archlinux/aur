# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=python-construct
pkgver=2.5.1
pkgrel=2
pkgdesc="Python library for declarative building/parsing of data structures."
arch=('any')
epoch=1
url="https://github.com/construct/construct"
license=('MIT')
depends=('python' 'python-six')
makedepends=('python-setuptools')
replaces=('construct')
source=(https://pypi.python.org/packages/source/c/construct/construct-2.5.1.tar.gz)
md5sums=('4881ed2208f6ee226b61e2310f696924')

build() {
  cd $srcdir/construct-$pkgver
  python setup.py build
}
package() {
  cd $srcdir/construct-$pkgver
  python setup.py install --root=$pkgdir
  install -D -m644 $srcdir/construct-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

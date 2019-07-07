# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=python2-construct
pkgver=2.9.45
pkgrel=1
pkgdesc="Python library for declarative building/parsing of data structures."
arch=('any')
epoch=1
url="https://github.com/construct/construct"
license=('MIT')
depends=('python2' 'python2-six')
makedepends=('python2-setuptools')
replaces=('construct')
source=(https://pypi.python.org/packages/source/c/construct/construct-${pkgver}.tar.gz)
md5sums=('2498a8fd0782c56df915be4948402db5')

build() {
  cd $srcdir/construct-$pkgver
  python2 setup.py build
}
package() {
  cd $srcdir/construct-$pkgver
  python2 setup.py install --root=$pkgdir
  install -D -m644 $srcdir/construct-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

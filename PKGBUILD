# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-tendo
pkgver=0.2.15
pkgrel=1
pkgdesc="Adds basic functionality that is not (yet) provided by Python"
arch=('any')
depends=('python2' 'python2-six')
makedepends=('python2-setuptools' 'python2-tox')
url="https://github.com/pycontribs/tendo"
license=('Python')
options=(!emptydirs)
source=(https://github.com/pycontribs/${pkgname#python2-}/archive/$pkgver.tar.gz)
md5sums=('SKIP')
sha256sums=('SKIP')

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

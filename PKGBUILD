# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-tendo
pkgver=0.2.15
pkgrel=1
pkgdesc="Adds basic functionality that is not (yet) provided by Python"
arch=('any')
depends=('python' 'python-six')
makedepends=('python-setuptools' 'python-tox')
url="https://github.com/pycontribs/tendo"
license=('Python')
options=(!emptydirs)
source=(https://github.com/pycontribs/${pkgname#python-}/archive/$pkgver.tar.gz)
md5sums=('SKIP')
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}

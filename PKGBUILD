# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-rstr
pkgver=2.2.3
pkgrel=1
pkgdesc="Generate random strings in Python"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/leapfrogdevelopment/rstr"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('dc43a09953ced7d40fa994da658b373c')
sha256sums=('10a58eb08a7e3735eddc8f32f3db419797dadb6335b02b94dcd8d741363d79e9')

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

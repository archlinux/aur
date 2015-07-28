
# Maintainer: smradlev

pkgname=python-pyfof
pkgver=0.1.2
pkgrel=1
arch=('x86_64')
url=('https://github.com/simongibbons/pyfof')
depends=('python' 'boost' 'cython2' 'python-numpy')
makedepends=('python-setuptools')
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)

md5sums=('406d585a97f2de8475d82f085bd6e6cb')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  sed -i  "s|/usr/local/include|/usr/include|g" setup.py	

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"
  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}


# Maintainer: Yani I <yani iliev me>

pkgname=python-dopy
pkgver=0.3.7
pkgrel=1
pkgdesc="Digital Ocean API Python wrapper"
arch=('any')
depends=('python' 'python-requests')
url="https://pypi.python.org/pypi/dopy"
license=('MIT')
source=(https://pypi.python.org/packages/source/d/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
sha256sums=('8d1a7a15ef5711220ee9fc3fd489e738bb365cdad042c4f791cd5c16f2dbf9fd')

build() {
  cd $srcdir/${pkgname#python-}-$pkgver

  msg 'Building...'
  python setup.py build
}

package() {
  cd $srcdir/${pkgname#python-}-$pkgver

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}

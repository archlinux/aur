# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-coloredlogs
pkgver=3.1.4
pkgrel=1
pkgdesc="Colored stream handler for the logging module"
arch=('any')
depends=('python2' 'python2-humanfriendly')
makedepends=('python2-setuptools')
url="https://github.com/xolox/python-coloredlogs"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('ce7749daf7e3af63fb987b465c451060')
sha256sums=('c906ef520d55b94ace4f0aad8625a89fc1d324f24ed2892cc1ac5d479183a14c')
provides=('coloredlogs' 'python2-coloredlogs')
conflicts=('coloredlogs')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

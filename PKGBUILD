# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-coloredlogs
pkgver=3.5
pkgrel=1
pkgdesc="Colored stream handler for the logging module"
arch=('any')
depends=('python2' 'python2-humanfriendly')
makedepends=('python2-setuptools')
url="https://github.com/xolox/python-coloredlogs"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('a548c95dfc76630688be90b0b0011f4f')
sha256sums=('c62b769d0b8b2de66ed8410caac8ed8ed2049666e2bcf81ac1f5a9eed5c4af32')
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

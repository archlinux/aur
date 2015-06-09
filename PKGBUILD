# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-camlipy
pkgver=0.1.1
pkgrel=2
pkgdesc="Unofficial Python client for Camlistore"
arch=('i686' 'x86_64')
depends=('python2' 'python2-dirtools' 'python2-docopt' 'python2-requests' 'python2-simplejson')
makedepends=('python2-setuptools')
url="https://github.com/tsileo/camlipy"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('4fecdeb281bab1dfc452a19eec7c6725')
sha256sums=('fba9edeeee542542ed49b68a3b07b9ef0388622a618ac3948a23aeda5be5d7ba')
provides=('camlipy' 'python2-camlipy')
conflicts=('camlipy')

build() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}

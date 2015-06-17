# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python2-pykickstart
pkgver=1.99.66
_tag=r$pkgver-1
pkgrel=2
pkgdesc='a python library that is used for reading and writing kickstart files'
arch=(any)
license=(GPL)
url='http://fedoraproject.org/wiki/Pykickstart'
depends=(python2 urlgrabber)
source=(pykickstart-$pkgver.zip::https://github.com/rhinstaller/pykickstart/archive/$_tag.zip)
sha1sums=('d4590a9e77b1cc7ef682cb96224a3b3a8218560b')

check() {
  cd pykickstart-$_tag
  python2 setup.py check
}

package() {
  cd pykickstart-$_tag
  python2 setup.py install --root="$pkgdir" --optimize=1
}

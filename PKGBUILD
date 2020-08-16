# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=exif-py
pkgver=2.3.1
pkgrel=1
pkgdesc="Easy to use Python2 module to extract Exif metadata from tiff and jpeg files."
arch=('any')
url="https://github.com/ianare/exif-py"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
conflicts=('exifread')
replaces=('exifread')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ianare/exif-py/archive/$pkgver.tar.gz")
sha1sums=('0982b11e578724400ca79026ca2d56a84a69c34b')

build() {
  cd "$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm755 EXIF.py "$pkgdir/usr/lib/python2.7/site-packages/EXIF.py"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

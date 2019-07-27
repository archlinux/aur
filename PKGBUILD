# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=exif-py
pkgver=2.2.0
pkgrel=1
pkgdesc="Easy to use Python module to extract Exif metadata from tiff and jpeg files."
arch=('i686' 'x86_64')
url="https://github.com/ianare/exif-py"
license=('custom:BSD')
depends=('python2' 'exifread')
source=("https://github.com/ianare/exif-py/archive/$pkgver.tar.gz")
md5sums=('8d0d6928c65867daa3acffeb17c6e3b1')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 EXIF.py "$pkgdir/usr/lib/python2.7/site-packages/EXIF.py"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/python2.7/site-packages/EXIF.py "$pkgdir/usr/bin/exif-py"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 ChangeLog.rst "$pkgdir/usr/share/doc/$pkgname/ChangeLog"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

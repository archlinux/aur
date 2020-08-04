# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Simon Chabot <simon dot chabot at etu dot utc dot fr>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname=python-exifread
_name="exif-py"
pkgver=2.3.0
pkgrel=1
pkgdesc="Python library to extract EXIF data from tiff and jpeg files"
arch=('any')
url="https://github.com/ianare/exif-py"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
# 2.2.0+ was not properly uploaded to PyPi, download the tarball from project's
# release page instead: https://github.com/ianare/exif-py/issues/102
source=("$pkgname-$pkgver.tar.gz::https://github.com/ianare/$_name/archive/$pkgver.tar.gz")
sha1sums=('337a34cb6facbc5008e92466e18e52c4c062d2fa')
sha256sums=('52c3f601971a622698827af881ccff76a1b334b0c998c2d8c2922d31a3fdf00f')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:

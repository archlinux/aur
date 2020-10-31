# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Simon Chabot <simon dot chabot at etu dot utc dot fr>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname=python-exifread
_name="exif-py"
pkgver=2.3.2
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
sha1sums=('9653949851358b6a65fa784601bfe9306621aec6')
sha256sums=('b595f8644a456d00df98b2f83b5fe17682bba0e7e9f7c8b39fb7130a80b73b0a')

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

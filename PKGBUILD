# Maintainer: minus <minus@mnus.de>

pkgname=python-libevdev
pkgver=0.6.1
pkgrel=1
pkgdesc="Python wrapper for libevdev "
url="https://gitlab.freedesktop.org/libevdev/python-libevdev"
license=('MIT')
source=("https://github.com/whot/python-libevdev/archive/$pkgver.tar.gz")
source=("https://gitlab.freedesktop.org/libevdev/python-libevdev/-/archive/$pkgver/python-libevdev-$pkgver.tar.gz")
sha512sums=('03aa883fa52d4d9373f39a39636c8ada3814f478b96e6f0e3987f77f8c37a5d117b5b9d44dce133a3a412c4b47dc7fb65a8e4db6728db3a1c068d79fb81a32dc')
arch=('i686' 'x86_64')
depends=(
  'python'
  'libevdev'
)

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set et sw=2 sts=2:

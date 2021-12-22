# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Buce <dmbuce@gmail.com>

_name=NBT
pkgname=python-${_name,,}
pkgver=1.5.1
pkgrel=1
pkgdesc="Named Binary Tag Reader/Writer"
url="https://github.com/twoolie/$_name"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/version-$pkgver.tar.gz")
sha256sums=('8b260dc68ed91819e990ca677ee05417e259145fb7531428a1f7b948d71367dc')

build() {
  cd "$_name-version-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-version-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

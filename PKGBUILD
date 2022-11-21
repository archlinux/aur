# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=python38-re-assert
_name=${pkgname#python38-}
pkgver=1.1.0
pkgrel=4
pkgdesc="Provides a helper class to make assertions of regexes simpler"
arch=('any')
url="https://github.com/asottile/re-assert"
license=('MIT')
depends=('python' 'python38-regex')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=($pkgname-$pkgver.tar.gz::https://github.com/asottile/re-assert/archive/v$pkgver.tar.gz)
sha256sums=('01c4a849ed520923e4bab9afdf73b5f2698c4f92ad7f580ccb3f68ea79c69c0c')

build() {
  cd "$_name-$pkgver"
  python3.8 setup.py build
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python3.8 setup.py install --root="$pkgdir" -O1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

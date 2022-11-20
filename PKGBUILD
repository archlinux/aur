# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=python38-sphobjinv
_name=${pkgname#python38-}
pkgver=2.3
pkgrel=1
pkgdesc="Manipulate and inspect Sphinx objects.inv files"
arch=('any')
url="https://github.com/bskinn/sphobjinv"
license=('MIT')
depends=('python38' 'python38-attrs' 'python38-certifi' 'python38-jsonschema')
makedepends=('python38-setuptools')
source=(https://github.com/bskinn/sphobjinv/archive/v$pkgver/$_name-$pkgver.tar.gz)
sha256sums=('29c2287afe54682bdc6ff66337c36af7dda63b1198166bae7aa0185012e46dde')

build() {
  cd "$_name-$pkgver"
  python3.8 setup.py build
}

package() {
  cd "$_name-$pkgver"
  python3.8 setup.py install --root="$pkgdir" -O1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

# vim:set ts=2 sw=2 et:

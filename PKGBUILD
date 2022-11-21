# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-purl
pkgver=1.6
pkgrel=3
pkgdesc="An immutable URL class for easy URL-building and manipulation"
arch=('any')
license=('MIT')
url="https://github.com/codeinthehole/purl"
depends=('python38-six')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://github.com/codeinthehole/purl/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('293079e9e15ac7e1669ea534ea8ac3aea92ebc1a18b33fc15e135e241da9c5612978946deca8fe3e53b39004ee33393317901ed3dfe053be12399591050dd9cd')

build() {
  cd purl-$pkgver
  python3.8 setup.py build
}

check() {
  cd purl-$pkgver
  python3.8 -m pytest
}

package() {
  cd purl-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Philippe Hürlimann <p at hurlimann dot org>

pkgname=python-ftfy
pkgver=5.7
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
depends=('python-wcwidth')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LuminosoInsight/${pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('ac2f15b301907489c9015de99039358e4a414b4f8312d8d80c4b00f561264b96616298477c8b1ac43eb211eb65528a74fe29de7ebccc072345dfbe53b5e40256')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"/LICENSE.txt
}

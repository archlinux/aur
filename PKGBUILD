# Maintainer: Kyle Westhaus <kwesthaus+aur at gmail dot com>
pkgname=ewmh_m2m
pkgver=1.1.3
pkgrel=1
pkgdesc="An EWMH-compliant move to monitor utility"
arch=('any')
url="https://github.com/AlexisBRENON/ewmh_m2m"
license=('MIT')
depends=('python' 'python-xcffib' 'python-xpybutil')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('00e51440fd2913b91a92292d89929748')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim:set ts=2 sw=2 et:

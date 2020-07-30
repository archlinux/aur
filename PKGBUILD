# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-unit-convert
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert units to different quantities"
arch=('any')
url="https://github.com/Peter92/unit-convert"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0c7f59b0fe6209889c96bce76990ce7afd57d8a77cd957fe0e90531a61aef984')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

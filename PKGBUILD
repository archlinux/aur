pkgname=python-configparser
_name=${pkgname#python-}
pkgver=4.0.2
pkgrel=1
pkgdesc="This library brings the updated configparser from Python 3.5 to Python 2.6-3.5."
arch=('any')
url="https://github.com/jaraco/configparser"
license=('MIT')
depends=('python')
makedepends=('python-setuptools-scm')
conflicts=('python-libconfigparser')
replaces=('python-libconfigparser')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c7d282687a5308319bf3d2e7706e575c635b0a470342641c93bea0ea3b5331df')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

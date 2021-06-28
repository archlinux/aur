# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=cpass-py
_name=cpass
pkgver=0.9.0
pkgrel=1
pkgdesc="An urwid based TUI frontend for pass"
arch=('any')
url="https://github.com/oliverlew/cpass"
license=('MIT')
depends=('pass' 'python-urwid' 'python3')
makedepends=('python-setuptools')
provides=('cpass')
conflicts=('cpass')
changelog=CHANGELOG
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('88e9b81f2c6bd6e8c6adb4a8d13565e261c7ffa105700e3d72ec7b57e06d9f81')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

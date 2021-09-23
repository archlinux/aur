# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=cpass-py
_name=cpass
pkgver=0.9.3
pkgrel=1
pkgdesc="An urwid based TUI frontend for pass"
arch=('any')
url="https://github.com/oliverlew/cpass"
license=('MIT')
depends=('pass' 'python-urwid')
makedepends=('python-setuptools')
provides=('cpass')
conflicts=('cpass')
changelog=CHANGELOG
install=cpass.install
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('75e139de3eaa0f87ea5fcc70a6c0b0521291700bc059d1edd1251e66c372cc34')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root "$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

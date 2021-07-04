# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=cpass-py
_name=cpass
pkgver=0.9.2
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
sha256sums=('8f55c68c12a8ac38677f55a168857bd730e2232c0af232f53b8a4a70ba9197aa')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

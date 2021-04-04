# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-cloup
_name=cloup
pkgver=0.7.0
pkgrel=1
pkgdesc="Cloup (= Click + groups) contains a set of Click extensions for multiple purposes."
arch=('any')
url="https://github.com/janLuke/cloup"
license=('MIT')
# makedepends=(
# )
provides=()
source=("https://files.pythonhosted.org/packages/5e/41/9cb38267c5dbec89a07cdb3549561d94ed6e81f3a6b62954358aaeb27d76/cloup-0.7.0.tar.gz")
sha512sums=('af1734fd4bbf47fd329cd170d9c2cd5edf2e98a505c3b7593f870ac34180074fee63465b8a41437e3c5813b369fed460029bd604c539aa37cd1b5ebec21291e7')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


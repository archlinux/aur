_name=schema
pkgname="python-$_name"
pkgver=0.6.5
pkgrel=1
pkgdesc='Python module to validate and convert data structures.'
arch=('i686' 'x86_64')
url="https://github.com/halst/$_name"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/s/$_name/$_name-$pkgver.tar.gz")
sha1sums=('5d2ec7bc20577099f614bc5ab2ee9096071f9fd3')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 {,"$pkgdir/usr/share/licenses/$pkgname/"}LICENSE-MIT
}

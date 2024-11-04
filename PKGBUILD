# Contributor: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=('pypi-search')
pkgver=2.0
pkgrel=1
pkgdesc="Get Information on Python Packages From PyPI"
arch=('any')
url="https://github.com/asadmoosvi/pypi-search"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/asadmoosvi/pypi-search/archive/refs/tags/v$pkgver.zip")
sha256sums=('bfb5f367c8fd9126a1dad97eff9093468462adee393dbfb8d1318659801ff6b7')

build() {
	cd "$srcdir/pypi-search-$pkgver"
	python setup.py build
}

package() {
	depends+=(python-html2text python-requests python-beautifulsoup4)
	cd "$srcdir/pypi-search-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

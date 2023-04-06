# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=('pypi-search')
pkgver=1.2.1
pkgrel=1
pkgdesc="Allows you to quickly query packages on PyPI"
arch=('any')
url="https://github.com/asadmoosvi/pypi-search"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/asadmoosvi/pypi-search/archive/refs/tags/v$pkgver.zip")
md5sums=('7fd0a4a526a5aa397cc9dbd5a4e06ab0')
sha256sums=('8f266bd3942ca17ab6f4dc89e918da196b00bd3ace08a3505dd8c35daeddfc10')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	depends+=(python-html2text python-requests python-beautifulsoup4)
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

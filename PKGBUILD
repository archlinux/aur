# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=('pypi-search')
pkgver=1.3.5
pkgrel=1
pkgdesc="Allows you to quickly query packages on PyPI"
arch=('any')
url="https://github.com/shidenko97/pypisearch"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/shidenko97/pypisearch/archive/refs/tags/$pkgver.zip")
md5sums=('1df369f1c24afe98c5b97fb660162aaf')
sha256sums=('a84e03d0948c5fec3a896a12fb6b44c0f2ebf7c856c1d6b863b36efa4bb89ebc')

build() {
	cd "$srcdir/pypisearch-$pkgver"
	python setup.py build
}

package() {
	depends+=(python-html2text python-requests python-beautifulsoup4 python-tabulate)
	cd "$srcdir/pypisearch-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: brent s. <bts[at]square-r00t[dot]net>
_name=dpath
pkgname=python-dpath
pkgver=2.0.6
pkgrel=1
pkgdesc='A python library for accessing and searching dictionaries via /slashed/paths ala xpath'
arch=(any)
url="https://pypi.org/project/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/d/$_name/$_name-$pkgver.tar.gz")
sha512sums=('6a008d6d12fadf9a45677b89b8a803f33ba9a83e54aec67c155d4e749bff4e60a5411a65a9361f3b70fa319b82ad2580735af407478bf7be022b81fc0b4a2434')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 "$srcdir/$_name-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -D -m644 "$srcdir/$_name-$pkgver/README.rst" "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

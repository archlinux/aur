# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

_name=dpath
pkgname=python-dpath
pkgver=2.0.6
pkgrel=2
pkgdesc='A python library for accessing and searching dictionaries via /slashed/paths ala xpath'
arch=(any)
url="https://pypi.org/project/$_name"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/d/$_name/$_archive.tar.gz")
sha512sums=('6a008d6d12fadf9a45677b89b8a803f33ba9a83e54aec67c155d4e749bff4e60a5411a65a9361f3b70fa319b82ad2580735af407478bf7be022b81fc0b4a2434')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.rst
}

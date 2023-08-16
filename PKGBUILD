# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

_name=dpath
pkgname=python-dpath
pkgver=2.1.6
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
sha256sums=('f1e07c72e8605c6a9e80b64bc8f42714de08a789c7de417e49c3f87a19692e47')

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

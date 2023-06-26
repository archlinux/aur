# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

_name=dpath
pkgname=python-dpath
pkgver=2.1.6
pkgrel=1
pkgdesc='A python library for accessing and searching dictionaries via /slashed/paths ala xpath'
arch=(any)
url="https://pypi.org/project/$_name"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/d/$_name/$_archive.tar.gz")
sha512sums=('2f2dac39b6e1ad2effd8d61ac4acf6619205423389ecebc54061aa10ec11ce3236ea666b632a7dca349e9b7a6579815c97e01c930eaa1a99d965e37b9825b82c')

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

# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

_name=dpath
pkgname=python-dpath
pkgver=2.2.0
pkgrel=2
pkgdesc='Filesystem-like pathing and searching for dictionaries'
arch=(any)
url="https://pypi.org/project/$_name"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/d/$_name/$_archive.tar.gz")
sha256sums=('34f7e630dc55ea3f219e555726f5da4b4b25f2200319c8e6902c394258dd6a3e')

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

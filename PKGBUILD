# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-beziers
_pyname=${pkgname#python-}.py
pkgver=0.6.0
pkgrel=2
pkgdesc='Routines for extracting information from font glyphs'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
# source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('842f43f4d8acf5691adc5dbc86c3c2b940035f8c08934fba356f77eee0260903')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

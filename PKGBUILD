# Maintainer: Philipp A. <flying-sheep@web.de>

_name=headerparser
pkgname=python-$_name
pkgver=0.5.2
pkgrel=1
pkgdesc='argparse for mail-style headers'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python python-attrs python-deprecated)
makedepends=(python-hatchling python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2e24ae218ed5d2ef5839fafeff084c40ee1e317bbbe6489cfe333385d7cb98e7')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

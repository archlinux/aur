# Maintainer: Philipp A. <flying-sheep@web.de>

_name=headerparser
pkgname=python-$_name
pkgver=0.5.1
pkgrel=1
pkgdesc='argparse for mail-style headers'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python python-attrs python-deprecated)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f4ca75b801b4d810cde2a278f5f07c9733e4d88e51085032fd909f5655df3ef3')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

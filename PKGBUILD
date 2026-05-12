pkgname=python-khidl
pkgver=1.3.6
pkgrel=1
pkgdesc="A Simple CLI for downloading game soundtracks"
arch=(any)
url=https://github.com/qwerinope/khidl
license=(MIT)
depends=(
	python-requests
	python-tqdm
	python-beautifulsoup4
	python-jsonschema
	python-prettytable
)
makedepends=(
	python-build
	python-installer
	python-setuptools
	python-wheel
)
source=(
	"https://github.com/qwerinope/khidl/archive/refs/tags/v$pkgver.zip"
)
sha256sums=('e0df11267a3591ff7c6b337fc3adbad41722c985372b1070935316f226fb57b4')

build() {
	cd $srcdir/khidl-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/khidl-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

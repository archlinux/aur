pkgname=python-khidl
pkgver=1.4.1
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
sha256sums=('49940d2697b36aa6d7a6a4b9283166f07c90f0cf1550dfd63847f3aa312a7996')

build() {
	cd $srcdir/khidl-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/khidl-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

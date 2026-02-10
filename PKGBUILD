pkgname=python-khidl
pkgver=1.3.4
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
sha256sums=('d6596de29984f0d191fb0a4a7f4bd7a9ed1f807ffc0b0e6679d8b474209146c0')

build() {
	cd $srcdir/khidl-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/khidl-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

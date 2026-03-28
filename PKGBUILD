pkgname=python-khidl
pkgver=1.3.5
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
sha256sums=('68759ed5ef778e1a347e8aeca73e31609e987e6b46763c55013f7bfab80628f0')

build() {
	cd $srcdir/khidl-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/khidl-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

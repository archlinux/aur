pkgname=python-khidl
pkgver=1.4.0
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
sha256sums=('8c70ca5353aa1c62a19c4bf4e80bf37aa616adec4db482a2ed01194021a0b3ca')

build() {
	cd $srcdir/khidl-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/khidl-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

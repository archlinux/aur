# Maintainer: Nevimmu <nevimmu@gmail.com>
pkgname=hyprfloat
pkgver=0.4.5
pkgrel=1
epoch=
pkgdesc="Float the terminal in empty workspace"
arch=("x86_64")
url="https://github.com/nevimmu/hyprfloat"
license=("MIT")
groups=()
depends=(
	"python"
)
makedepends=(
	"git"
	"python-setuptools"
	"python-build"
	"python-installer"
	"python-wheel"
)
source=(
	"${pkgname}-${pkgver}::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

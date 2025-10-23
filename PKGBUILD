# Maintainer: Nevimmu <nevimmu@gmail.com>
pkgname=hyprdvd
pkgver=0.4.2
pkgrel=1
epoch=
pkgdesc="Bouncy DVD-like terminal"
arch=("x86_64")
url="https://github.com/nevimmu/hyprdvd"
license=("MIT")
groups=()
depends=(
	"python"
	"python-argcomplete"
	"python-dbus"
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

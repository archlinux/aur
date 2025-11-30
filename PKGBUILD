# Maintainer: Lorenz Steinert <lsteinert+aur@uraziel.de>

_name=pytest-emoji
pkgname=python-$_name
pkgver=0.2.0
pkgrel=1
pkgdesc="A pytest plugin that adds emojis to your test result report 😍"
arch=('any')
url="https://github.com/hackebrot/$_name"
license=('MIT')
depends=(
	'python-pytest'
)
optdepends=()
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
)
checkdepends=(
)
source=(
	"$_name-$pkgver.tar.gz::https://github.com/hackebrot/$_name/archive/refs/tags/$pkgver.tar.gz"
)

build() {
	cd "$_name-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('29ebe826a1b791cd814a65be9743963d42855a47dcbecb8b2ce5323473d85b91')

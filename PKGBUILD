# Maintainer: Lorenz Steinert <lsteinert+aur@uraziel.de>

_name=django-rich
pkgname=python-django-rich
pkgver=2.2.0
pkgrel=1
pkgdesc="Extensions for using Rich with Django."
arch=('any')
url="https://github.com/adamchainz/${_name}"
license=('MIT')
depends=(
	'python'
	'python-django'
	'python-rich'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
)
checkdepends=()
optdepends=()
source=(
	"django-rich::https://github.com/adamchainz/$_name/archive/refs/tags/$pkgver.tar.gz"
)

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/python-django-rich/LICENSE"
}
sha256sums=('1a5b49d6fad0de4231a035b3541578a932d1a5c1b46317a143d5f9f13748499f')

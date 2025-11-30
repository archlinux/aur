# Maintainer: Lorenz Steinert <lsteinert+aur@uraziel.de>

_name=django-choices-field
pkgname=python-$_name
pkgver=3.1.1
pkgrel=1
pkgdesc="Django field that set/get django's new TextChoices/IntegerChoices enum"
arch=('any')
url="https://github.com/bellini666/$_name"
license=('MIT')
depends=(
	'python'
	'python-django'
	'python-typing_extensions'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-poetry-core'
)
source=(
	"$_name-$pkgver.tar.gz::https://github.com/bellini666/django-choices-field/archive/refs/tags/v$pkgver.tar.gz"
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

sha256sums=('41591e4c76984a02cb50d92a6039b611d56f5f9f406082d5d46f758650061764')

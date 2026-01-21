# Maintainer: Lorenz Steinert <lsteinert+aur@uraziel.de>

_name=strawberry-graphql-django
pkgname=python-$_name
pkgver=0.74.1
pkgrel=1
pkgdesc=" Strawberry GraphQL Django extension"
arch=('any')
url="https://github.com/strawberry-graphql/strawberry-django"
license=('MIT')
depends=(
	'python'
	'python-django'
	'python-asgiref'
	'python-strawberry-graphql'
	'python-graphql-core'
	'python-typing_extensions'
)
optdepends=(
	'python-django-choices-field'
	'python-debug-toolbar'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-hatchling'
	'python-setuptools'
)
source=(
	"$_name-$pkgver.tar.gz::https://github.com/strawberry-graphql/strawberry-django/archive/refs/tags/$pkgver.tar.gz"
)

build() {
	cd "strawberry-django-$pkgver"

	python -m build --wheel --no-isolation
}

package() {
	cd "strawberry-django-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('a02d30d0a74c6d0bb7fbea4f6846062e29bfb34181f07109c41ea7733beadc69')

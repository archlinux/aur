# Maintainer: Lorenz Steinert <lsteinert+aur@uraziel.de>

_name=strawberry-graphql-django
pkgname=python-$_name
pkgver=0.67.2
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
	'python-poetry-core'
	'python-setuptools'
)
source=(
	"$_name-$pkgver.tar.gz::https://github.com/strawberry-graphql/strawberry-django/archive/refs/tags/v$pkgver.tar.gz"
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
sha256sums=('b496c5295062a767de68b3acaea383602337954b23c175e7e4df609bb05be7d5')

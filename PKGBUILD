# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='python-django-icons'
_name='django-icons'
pkgver=23.5
pkgrel=1
pkgdesc='Icons for Django'
arch=('any')
url='https://pypi.org/project/django-icons/'
license=('BSD')
depends=(
	'python-beautifulsoup4'
	'python-django'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-hatchling'
	'python-setuptools'
	'python-setuptools-scm'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8ef5e27c069db9051a10f2d6d20aa276261d7dc13dbf7e85feb370cad18eafa8')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

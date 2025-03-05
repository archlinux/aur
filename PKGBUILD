# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='python-django-icons'
_name='django-icons'
pkgver=24.4
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('8ae699e22cfc6a80a62eaa267a1d345f2c79adfa6f68f7f67a0316fefac977b3')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

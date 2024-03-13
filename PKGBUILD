# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='python-django-icons'
_name='django-icons'
pkgver=23.4
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
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('dc457c7297452c4f117ae8feb65dd571448c2fcbf4b14fe57eb7a96dd9e929b2')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='python-django-icons'
_name='django-icons'
pkgver=25.1
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
sha256sums=('a95eefdc0e1c3a8193b40ca2228824e61ac7dffa37d27dcf7cf2efef9d180881')

build() {
	cd "${_name//-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name//-/_}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

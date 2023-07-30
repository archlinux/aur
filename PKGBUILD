# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname='python-django-icons'
_name='django_icons'
pkgver=23.3
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
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('353f6893066e7a6ef469330ed1e66ca319435b7efab631b2c14470ea84ac056b')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

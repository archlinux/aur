# Maintainer: Razer <razer@neuf.fr>

pkgname=('python-django-celery-results')
_pypi_pkgname=('django_celery_results')
pkgver=2.0.1
pkgrel=0
pkgdesc='Celery Result Backends using the Django ORM/Cache framework'
arch=('any')
url='http://github.com/celery/django-celery-results'
license=('BSD')
makedepends=('python-setuptools' 'python-django' 'python-celery')
checkdepends=('python-django' 'python-celery')
optdepends=()              
conflicts=()
provides=('python-django-celery-results')
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('d625e324138e5b2ef46ffa9e89fa353c16d619420066ac8b240ef9247b293a84')

build() {
  cd "$srcdir"/"$_pypi_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir"/"$_pypi_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 || return 1
}

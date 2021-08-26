# Maintainer: Razer <razer@neuf.fr>

pkgname=('python-django-celery-results')
_pypi_pkgname=('django_celery_results')
pkgver=2.2.0
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
sha256sums=('cc0285090a306f97f1d4b7929ed98af0475bf6db2568976b3387de4fbe812edc')

build() {
  cd "$srcdir"/"$_pypi_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir"/"$_pypi_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 || return 1
}

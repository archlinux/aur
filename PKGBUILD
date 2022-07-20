# Maintainer: Razer <razer@neuf.fr>

pkgname=('python-django-celery-results')
_pypi_pkgname=('django_celery_results')
pkgver=2.4.0
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
sha256sums=('75aa51970db5691cbf242c6a0ff50c8cdf419e265cd0e9b772335d06436c4b99')

build() {
  cd "$srcdir"/"$_pypi_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir"/"$_pypi_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 || return 1
}

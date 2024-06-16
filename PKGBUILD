
pkgname=python-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=4.8.0
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python' 'python-django' 'python-ldap')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("https://github.com/django-auth-ldap/django-auth-ldap/archive/$pkgver.tar.gz")
md5sums=('d67ce6bb53584f83559cf2c6ea3dec8f')

package() {
  cd "$_pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

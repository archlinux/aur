# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Xavier Corredor <xavier.corredor.llano (a) gmail.com>
pkgname=python-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=5.2.0
pkgrel=1
pkgdesc="Django LDAP authentication backend"
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python' 'python-django' 'python-ldap')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/django-auth-ldap/django-auth-ldap/archive/$pkgver.tar.gz")
md5sums=('202578bb85a181afb65aa192612d4861')

package() {
  cd "$_pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

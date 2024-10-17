# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Xavier Corredor <xavier.corredor.llano (a) gmail.com>
pkgname=python-django-auth-ldap
_pkgname=django-auth-ldap
pkgver=5.0.0
pkgrel=1
pkgdesc="This is a Django authentication backend that authenticates against an LDAP service."
arch=(any)
url="https://pypi.python.org/pypi/django-auth-ldap"
license=('LGPL')
depends=('python' 'python-django' 'python-ldap')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/django-auth-ldap/django-auth-ldap/archive/$pkgver.tar.gz")
md5sums=('54ad53a80f8b81d9bbdfd0fa6bf43477')

package() {
  cd "$_pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

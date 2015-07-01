# Maintainer: James Bulmer <nekinie@gmail.com>

pkgname="python2-django-openstack-auth"
pkgver=1.3.1
pkgrel=2
pkgdesc="Django authentication backend for use with Openstack identity"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/django_openstack_auth"
license=("Apache")

depends=(
  "python2"
  "python2-pbr"
  "python2-keystoneclient"
  "python2-django"
)

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/d/django_openstack_auth/django_openstack_auth-${pkgver}.tar.gz")
md5sums=("e3baf9119efec6c3a592161b97085b19")

build() {
  cd "${srcdir}/django_openstack_auth-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/django_openstack_auth-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

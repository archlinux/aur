# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-django-rest-framework-jwt' 'python2-django-rest-framework-jwt')
pkgver=1.11.0
pkgrel=1
pkgdesc="JSON Web Token Authentication support for Django REST Framework"
arch=(any)
url="https://github.com/GetBlimp/django-rest-framework-jwt"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1d1595123db26fdbfe8c29b9795afaac8f8dd67140979135c5238705c1a57f44')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-django-rest-framework-jwt() {
  depends=('python-django' 'python-django-rest-framework')
  cd "$srcdir/django-rest-framework-jwt-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-rest-framework-jwt() {
  depends=('python2-django' 'python2-django-rest-framework')
  cd "$srcdir/django-rest-framework-jwt-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-django-versatile-imagefield' 'python2-django-versatile-imagefield')
pkgver=1.10
pkgrel=1
pkgdesc="Drop-in replacement for django's ImageField, provides a flexible, intuitive and easily-extensible interface"
arch=(any)
url="https://github.com/respondcreate/django-versatileimagefield"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2f9a846731e10464ca99f1b3cde97d9fc7b432e81134e43f5b377945853abaa4')
makedepends=('python-setuptools' 'python2-setuptools')

prepare() {
  cd "$srcdir/django-versatileimagefield-$pkgver"
  rm -rf tests
}

package_python-django-versatile-imagefield() {
  depends=('python-django' 'python-pillow' 'python-django-rest-framework')
  cd "$srcdir/django-versatileimagefield-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-versatile-imagefield() {
  depends=('python2-django' 'python2-pillow' 'python2-django-rest-framework')
  cd "$srcdir/django-versatileimagefield-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
